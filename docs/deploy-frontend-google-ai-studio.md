# Déployer des frontends vers Google Cloud depuis Cursor

Ce guide explique comment déployer des applications frontend depuis Cursor vers **Google Cloud Run** — la même plateforme que Google AI Studio utilise quand vous cliquez sur « Deploy app » dans [AI Studio](https://aistudio.google.com/). Vous gardez ainsi un flux unique : développer en local dans Cursor, déployer sur la même infra que les apps AI Studio.

---

## En bref

| Où vous construisez | Où ça part |
|---------------------|------------|
| **Google AI Studio** (navigateur) | Cloud Run (bouton « Deploy app ») |
| **Cursor** (ce repo) | Cloud Run (via MCP Cloud Run) |

Les deux aboutissent à une **URL HTTPS** sur Cloud Run (scale automatique, facturation à l’usage, clé API Gemini gérée côté serveur si besoin).

---

## Prérequis

1. **Node.js** (LTS recommandé) — [nodejs.org](https://nodejs.org/)
2. **Google Cloud SDK (gcloud)** — [Installation](https://cloud.google.com/sdk/docs/install)
3. **Compte Google Cloud** avec facturation activée et un **projet** créé

---

## 1. Authentification Google Cloud

Dans un terminal (PowerShell ou CMD) :

```powershell
# Connexion à votre compte Google
gcloud auth login

# Création des identifiants pour les applications (nécessaire pour le MCP)
gcloud auth application-default login
```

Cela ouvre le navigateur pour vous connecter. Une fois fait, le MCP pourra déployer en votre nom.

---

## 2. Activer Cloud Run et choisir le projet

```powershell
# Remplacer MY_PROJECT_ID par l’ID de votre projet GCP
gcloud config set project MY_PROJECT_ID

# Activer l’API Cloud Run (si pas déjà fait)
gcloud services enable run.googleapis.com
```

---

## 3. Configurer le MCP Cloud Run dans Cursor

Le serveur MCP **Cloud Run** permet à Cursor (et à l’IA) d’appeler des outils comme « déployer ce dossier » ou « lister les services ».

### Option A : configuration au niveau du projet (recommandé)

Le fichier `.cursor/mcp.json` de ce repo contient déjà une entrée pour Cloud Run. Après avoir redémarré Cursor, le serveur MCP sera disponible dans ce workspace.

Vous pouvez personnaliser les valeurs par défaut en éditant `.cursor/mcp.json` et en ajoutant la section `env` (voir commentaire dans le fichier).

### Option B : configuration globale Cursor

Sous Windows, vous pouvez aussi ajouter le serveur dans la config globale :

- Fichier : `%APPDATA%\Cursor\mcp.json`
- Ou via Cursor : **Paramètres → Tools & MCP → Add new MCP server**

Exemple de contenu pour `mcp.json` (global ou projet) :

```json
{
  "mcpServers": {
    "cloud-run": {
      "command": "npx",
      "args": ["-y", "@google-cloud/cloud-run-mcp"],
      "env": {
        "GOOGLE_CLOUD_PROJECT": "VOTRE_PROJECT_ID",
        "GOOGLE_CLOUD_REGION": "europe-west1",
        "DEFAULT_SERVICE_NAME": "mon-frontend"
      }
    }
  }
}
```

Après toute modification de la config MCP, **redémarrer Cursor** pour que le serveur soit chargé.

---

## 4. Déployer un frontend depuis Cursor

Une fois le MCP Cloud Run actif :

1. **Ouvrir le dossier du frontend** : le projet à déployer doit être un dossier contenant votre app (HTML/JS, ou Node, ou un build statique, etc.).
2. **Dans le chat Cursor**, vous (ou l’IA) pouvez demander par exemple :
   - « Déploie le dossier `mon-frontend` sur Cloud Run »
   - « Déploie le répertoire courant sur Cloud Run avec le nom de service `mon-app` »

Les outils MCP utilisés en arrière-plan sont notamment :

- **`deploy-local-folder`** : déploie un dossier local vers un service Cloud Run (disponible quand le MCP tourne en local).
- **`list-services`** : liste les services Cloud Run du projet/région.
- **`get-service`** : détails d’un service.
- **`get-service-log`** : consulter les logs d’un service.

Si vous n’avez pas défini `GOOGLE_CLOUD_PROJECT` / `GOOGLE_CLOUD_REGION` / `DEFAULT_SERVICE_NAME` dans `env`, vous devrez les indiquer lors de l’appel (ou les configurer dans `mcp.json`).

---

## 5. Vérification

- **Console Google Cloud** : [Cloud Run](https://console.cloud.google.com/run) → votre service apparaît avec une URL.
- **MCP** : demander dans Cursor « liste les services Cloud Run » pour voir les déploiements.

---

## 6. Appeler Gemini / utiliser AI Studio depuis ce projet

**Peut-on « appeler un projet Google AI Studio » depuis ici (Cursor) ?**

- Il n’existe **pas** d’API du type « exécute le projet AI Studio n° X » : on ne peut pas invoquer un projet AI Studio par ID depuis du code.
- En revanche, vous pouvez **utiliser la même API (Gemini)** depuis ce repo, avec la logique de vos prompts AI Studio recopiée dans le code.

**À faire :**

1. **Clé API**  
   Créer ou récupérer une clé dans [Google AI Studio → Get API key](https://aistudio.google.com/app/apikey). La stocker en variable d’environnement (ex. `GEMINI_API_KEY` ou `GOOGLE_API_KEY`) et ne jamais la commiter.

2. **Réutiliser un prompt conçu dans AI Studio**  
   Dans AI Studio, une fois le prompt au point : **Get code** pour obtenir un extrait (JavaScript, Python, etc.). Copier cet extrait dans votre projet Cursor et l’appeler avec votre clé API. Vous n’appelez pas « le projet », vous appelez l’API Gemini avec le même modèle et le même type de prompt.

3. **Appels depuis le code (exemples)**  
   - **Node.js** : SDK `@google/generative-ai` — [doc](https://ai.google.dev/gemini-api/docs).  
   - **Python** : `google-genai` — `genai.Client()` puis `generate_content(...)`.  
   - **REST** : requêtes HTTP vers l’endpoint Gemini avec votre clé en en-tête.

En résumé : depuis « ici » (Cursor), vous **appelez l’API Gemini** (avec une clé issue d’AI Studio), pas un « projet » AI Studio. Les projets AI Studio servent à prototyper et à exporter du code ; ce code s’exécute dans votre propre application.

---

## Résumé

- **Google AI Studio** : vous construisez l’app dans le navigateur → « Deploy app » → Cloud Run.
- **Cursor** : vous construisez l’app dans ce repo (ou un sous-dossier) → MCP Cloud Run (`deploy-local-folder`) → Cloud Run.

Les deux aboutissent à des frontends hébergés sur Google Cloud Run, déployables et gérables depuis Cursor une fois le MCP configuré et l’auth gcloud faite.
