# Déployer dans Microsoft Power Apps

Ce guide décrit les étapes pour **publier** et **déployer** des applications (canvas apps, model-driven apps) dans **Microsoft Power Apps**. La méthode recommandée pour piloter depuis Cursor est le **pac CLI** (Power Platform CLI). L'interface web reste disponible pour les opérations manuelles.

---

## En bref

| Objectif | Action recommandée |
|----------|--------------------|
| **Mettre une app en service** | Interface web : Save → Publish → Share. |
| **Deployer vers un autre environnement** (CLI) | `pac solution export` → `pac solution import` → `pac solution publish` |

---

## Prerequis

- **Compte Microsoft** (pro ou scolaire pour Power Apps complet).
- Acces a [Power Apps](https://make.powerapps.com/).
- **Environnement** Power Platform pour creer et executer les apps.
- **Power Platform CLI (pac)** pour les operations en ligne de commande (voir section 0).

---

## 0. Installer et configurer pac CLI (recommande depuis Cursor)

Le **pac CLI** permet de piloter Power Apps (et Power Automate) depuis le terminal.

### Installation

1. **Prerequis : .NET 10+** — verifier avec `dotnet --version` ([Telecharger .NET](https://dotnet.microsoft.com/download))

2. **Installer pac CLI**

   ```powershell
   dotnet tool install --global Microsoft.PowerApps.CLI.Tool
   ```

   Verification : `pac --version`
   Mise a jour : `dotnet tool update --global Microsoft.PowerApps.CLI.Tool`

### Authentification et selection de l'environnement

3. **S'authentifier sur l'environnement source**

   ```powershell
   pac auth create --environment https://ORG.crm.dynamics.com
   ```

   L'URL de votre organisation est visible dans [make.powerapps.com](https://make.powerapps.com/) → Settings → Session details.

4. **Verifier l'environnement actif**

   ```powershell
   pac org who
   ```

### Commandes pac CLI essentielles

| Commande | Action |
|----------|--------|
| `pac solution export --name NOM --path ./solution.zip` | Exporter une solution |
| `pac solution import --path ./solution.zip` | Importer une solution |
| `pac solution publish` | Publier toutes les customizations |
| `pac solution check --path ./solution.zip` | Verifier la solution avant deploiement |
| `pac auth create --environment URL` | Changer d'environnement cible |
| `pac org list` | Lister les environnements disponibles |

---

## 1. Creer, enregistrer et publier une app (mise en service — interface web)

### Canvas app

1. **Ouvrir Power Apps**
   [make.powerapps.com](https://make.powerapps.com/) → se connecter.

2. **Creer ou modifier l'app**
   - **Create** → **Canvas app** (blank ou from data) ou ouvrir une app existante.
   - Concevoir l'app (ecrans, controles, formules, connexions).

3. **Enregistrer**
   - **Save** (ou Ctrl+S). Chaque enregistrement cree une version dans l'historique.

4. **Publier**
   - **Publish** dans la barre de commandes.
   - Si des changements ne sont pas sauvegardes, Power Apps propose de sauvegarder d'abord.
   - Saisir une description (optionnel : « Create descriptions using AI » en environnement manage) → **Publish this version**.

5. **Partager l'app**
   - **Apps** → selectionner l'app → **Share**.
   - Ajouter des utilisateurs ou groupes (Microsoft Entra ID).
   - Choisir le niveau : **User** (utilisation), **Co-owner** (modifier, partager), ou roles specifiques si l'app utilise Dataverse.

### Model-driven app

- Meme logique : enregistrer les changements, **Publish** les personnalisations (customizations), puis partager ou distribuer via une solution.

---

## 2. Deployer vers un autre environnement via pac CLI (recommande)

Pour passer d'un environnement (ex. developpement) a un autre (ex. production ou UAT) :

### 2.1 Ajouter l'app dans une solution (interface web — une seule fois)

Si l'app n'est pas encore dans une solution :

1. [make.powerapps.com](https://make.powerapps.com/) → **Solutions** → **New solution** : nom, editeur.
2. **Add existing** → **App** → choisir **Canvas app** ou **Model-driven app** → selectionner l'app → **Add**.
3. Accepter d'inclure les dependances si demande.

### 2.2 Exporter la solution (pac CLI)

```powershell
# S'assurer d'etre sur l'environnement source
pac auth create --environment https://ORG-SOURCE.crm.dynamics.com

# Exporter la solution
pac solution export --name NOM_SOLUTION --path ./solution.zip
```

Pour exporter en version **managed** (production) :

```powershell
pac solution export --name NOM_SOLUTION --path ./solution.zip --managed
```

### 2.3 Importer dans l'environnement cible (pac CLI)

```powershell
# Basculer sur l'environnement cible
pac auth create --environment https://ORG-CIBLE.crm.dynamics.com

# Importer
pac solution import --path ./solution.zip

# Publier les customizations (si solution non managee)
pac solution publish
```

**Points importants :**

- Solutions non managees en dev, export managed pour test/production.
- Les connexions (comptes, API) peuvent devoir etre recreees dans l'environnement cible.
- Taille max. du fichier : 95 MB.

---

## 3. Deployer vers un autre environnement via l'interface web (alternatif)

### 3.1 Exporter la solution

1. [make.powerapps.com](https://make.powerapps.com/) → **Solutions** → ouvrir la solution.
2. **Publish all customizations** avant l'export.
3. **Export** → choisir **Unmanaged** ou **Managed** → telecharger le `.zip`.

### 3.2 Importer dans l'environnement cible

1. Se connecter a Power Apps dans l'environnement cible.
2. **Solutions** → **Import** → selectionner le `.zip` → suivre l'assistant.
3. Si solution non managee : **Publish all customizations** pour activer les composants.
4. Partager l'app et attribuer les roles de securite si l'app utilise Dataverse.

---

## 4. Bonnes pratiques (ALM)

- **Environnements** : developpement → test/UAT → production.
- **Solutions non managees** en dev, export en **managed** pour test/production.
- **Source control** : versionner les solutions exportees (Solution Packager pour decomposer en fichiers).
- **Partage** : documenter qui a acces (User / Co-owner) et les roles Dataverse.

---

## 5. Verification

- **pac CLI** : `pac org who` pour confirmer l'environnement ; `pac solution list` pour lister les solutions.
- **Interface web** : [make.powerapps.com](https://make.powerapps.com/) → **Apps** → l'app est listee ; les utilisateurs avec partage peuvent l'ouvrir.

---

## Resume

- **Mise en service** : Save → Publish → Share dans l'interface web.
- **Deploiement CLI (recommande)** : `pac solution export` → `pac solution import` → `pac solution publish`.
- **Deploiement web** : Solutions → Export → Import dans l'environnement cible → Publish all customizations.

Documentation : [pac CLI reference](https://learn.microsoft.com/en-us/power-platform/developer/cli/reference/solution), [Save and publish canvas apps](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/save-publish-app), [Export solutions](https://learn.microsoft.com/en-us/power-apps/maker/data-platform/export-solutions).
