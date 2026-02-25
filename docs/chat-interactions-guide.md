# Guide : Interagir avec les outils depuis le chat Cursor

Ce guide explique comment utiliser le **chat Cursor** pour piloter chacun des outils installés sur cette machine. Pour chaque outil, vous trouverez : ce que vous pouvez demander en langage naturel, les exemples de formulations, et ce que l'IA fait en arrière-plan.

---

## Principe général

Dans le chat Cursor, vous n'avez pas besoin de connaître les commandes exactes. Il suffit de **décrire ce que vous voulez faire** en français. L'IA :
1. Choisit le bon outil.
2. Lance les commandes dans le terminal.
3. Vous donne le résultat et explique si besoin.

---

## 1. Git — Versionner et synchroniser le code

**Ce que vous pouvez demander :**

> « Montre-moi l'état du projet (fichiers modifiés, en attente de commit). »

> « Crée un commit avec tous les fichiers modifiés. Message : mise à jour du guide de déploiement. »

> « Pousse les changements sur GitHub. »

> « Crée une nouvelle branche `feature/mon-outil` et bascule dessus. »

> « Fusionne la branche `feature/mon-outil` dans `main`. »

> « Affiche l'historique des 5 derniers commits. »

**Ce que l'IA fait :** lance `git status`, `git add`, `git commit`, `git push`, `git checkout`, `git merge`, etc. dans le terminal.

---

## 2. Node.js / npm — Gérer les dépendances et lancer des scripts

**Ce que vous pouvez demander :**

> « Installe les dépendances du projet. »

> « Lance le serveur de développement. »

> « Ajoute la dépendance `axios` au projet. »

> « Mets à jour toutes les dépendances. »

> « Lance les tests. »

> « Compile le projet pour la production. »

**Ce que l'IA fait :** lance `npm install`, `npm run dev`, `npm install axios`, `npm update`, `npm test`, `npm run build`, etc.

---

## 3. Google Cloud SDK (gcloud) — Gérer GCP et déployer sur Cloud Run

**Ce que vous pouvez demander :**

> « Connecte-moi à Google Cloud. »

> « Définis le projet GCP actif sur `mon-projet-id`. »

> « Déploie le dossier `./frontend` sur Cloud Run avec le nom de service `mon-app`. »

> « Liste mes services Cloud Run dans la région `europe-west1`. »

> « Affiche les logs du service `mon-app`. »

> « Active l'API Cloud Run sur mon projet. »

> « Crée un notebook NotebookLM intitulé `Analyse produit`. »

> « Ajoute l'URL `https://example.com/article` comme source au notebook `NOTEBOOK_ID`. »

**Ce que l'IA fait :** lance `gcloud auth login`, `gcloud config set project`, `gcloud run deploy`, `gcloud run services list`, et des appels `curl` REST pour NotebookLM.

**Note :** pour NotebookLM, vous aurez besoin de `gcloud auth login --enable-gdrive-access` pour les sources Google Docs. La conversation elle-même reste dans le navigateur.

---

## 4. MCP Cloud Run — Déployer un frontend directement depuis le chat

Le MCP Cloud Run est une intégration spéciale : l'IA peut déployer **sans passer par le terminal**, directement depuis le chat.

**Ce que vous pouvez demander :**

> « Déploie le dossier `./mon-frontend` sur Cloud Run. »

> « Déploie le répertoire courant sur Cloud Run avec le nom `mon-app`. »

> « Liste mes services Cloud Run. »

> « Donne-moi les détails du service `mon-app`. »

> « Affiche les logs du service `mon-app`. »

> « Crée un nouveau projet GCP et déploie dessus. »

**Prérequis :** être connecté avec `gcloud auth login` et avoir le MCP configuré dans `.cursor/mcp.json` (déjà fait dans ce repo). Redémarrer Cursor si ce n'est pas encore actif.

---

## 5. Vercel CLI — Déployer des frontends sur Vercel

**Ce que vous pouvez demander :**

> « Déploie le dossier `./frontend` sur Vercel en preview. »

> « Déploie en production sur Vercel. »

> « Connecte ce projet à mon compte Vercel. »

> « Lie ce repo Git à mon projet Vercel. »

**Ce que l'IA fait :** lance `vercel`, `vercel --prod`, `vercel login`, `vercel git connect` dans le terminal depuis le bon dossier.

**Note :** la première fois, Vercel demandera de se connecter dans le navigateur.

---

## 6. pac CLI (Power Platform) — Déployer des apps Power Apps et flows Power Automate

**Ce que vous pouvez demander :**

> « Connecte-moi à l'environnement Power Platform `https://monorg.crm.dynamics.com`. »

> « Exporte la solution `MaSolution` dans le fichier `./solution.zip`. »

> « Importe le fichier `./solution.zip` dans l'environnement cible. »

> « Publie toutes les customizations Power Apps. »

> « Liste les solutions disponibles dans l'environnement actif. »

> « Quel environnement Power Platform est actif en ce moment ? »

**Ce que l'IA fait :** lance `pac auth create`, `pac solution export`, `pac solution import`, `pac solution publish`, `pac org who`, etc.

**Note :** pac CLI est dans `~/.dotnet/tools`. Si une erreur de commande inconnue apparaît, demander à l'IA de recharger le PATH.

---

## 7. .NET SDK (dotnet) — Gestion des outils .NET

**Ce que vous pouvez demander :**

> « Vérifie la version de .NET installée. »

> « Mets à jour pac CLI. »

> « Liste les outils .NET installés globalement. »

**Ce que l'IA fait :** lance `dotnet --version`, `dotnet tool update --global Microsoft.PowerApps.CLI.Tool`, `dotnet tool list --global`.

---

## 8. Notebook LM — Créer et alimenter des notebooks

**Via gcloud + API REST** (voir aussi `docs/notebook-lm-communicate.md`) :

**Ce que vous pouvez demander :**

> « Crée un nouveau notebook NotebookLM intitulé `Veille technologique`. »

> « Ajoute l'URL `https://example.com/article` comme source au notebook `NOTEBOOK_ID`. »

> « Ajoute la vidéo YouTube `https://youtube.com/watch?v=XXXXX` au notebook `NOTEBOOK_ID`. »

> « Liste mes notebooks NotebookLM récents. »

> « Partage le notebook `NOTEBOOK_ID` avec `colleague@example.com`. »

**Ce que l'IA fait :** appels `curl` REST vers l'API NotebookLM Enterprise avec votre token gcloud.

**Pour la conversation :** ouvrir dans le navigateur `https://notebooklm.cloud.google.com/LOCATION/notebook/NOTEBOOK_ID?project=PROJECT_NUMBER`.

---

## 9. Google AI Studio / Gemini API — Appeler un modèle Gemini depuis le code

**Ce que vous pouvez demander :**

> « Crée un script Node.js qui appelle Gemini avec ce prompt : `Résume ce texte`. »

> « Ajoute un appel à l'API Gemini dans la fonction `analyzeText`. »

> « Exporte le code depuis AI Studio et intègre-le dans le projet. »

**Ce que l'IA fait :** génère du code utilisant le SDK `@google/generative-ai` (Node) ou `google-genai` (Python), avec votre clé API en variable d'environnement.

**Prérequis :** avoir une clé API dans [AI Studio → Get API key](https://aistudio.google.com/app/apikey), stockée dans `.env` (`GEMINI_API_KEY=...`).

---

## 10. Power Apps / Power Automate — Déployer sans quitter Cursor

**Ce que vous pouvez demander :**

> « Exporte la solution Power Apps `CRM_App` depuis l'environnement de dev. »

> « Importe et publie cette solution sur l'environnement de production. »

> « Vérifie la solution avant de la déployer. »

> « Bascule sur l'environnement `https://prod.crm.dynamics.com`. »

**Ce que l'IA fait :** `pac auth create`, `pac solution export`, `pac solution import`, `pac solution publish`, `pac solution check`.

---

## Récap — Formulations utiles dans le chat

| Ce que vous tapez | Outil utilisé |
|-------------------|---------------|
| « Commit et push les changements » | Git |
| « Installe les dépendances » | npm |
| « Déploie sur Cloud Run » | gcloud / MCP Cloud Run |
| « Déploie sur Vercel » | Vercel CLI |
| « Exporte la solution Power Apps » | pac CLI |
| « Crée un notebook NotebookLM » | gcloud + API REST |
| « Appelle Gemini avec ce prompt » | Gemini API (code) |
| « Qu'est-ce qui a changé depuis le dernier commit ? » | Git |
| « Lance le serveur de dev » | npm |
| « Publie les customizations Power Apps » | pac CLI |

---

## Conseils

- **Soyez précis sur le nom du projet / dossier / service** quand vous le connaissez. L'IA demandera si c'est ambigu.
- **Pour les opérations sensibles** (déploiement en production, suppression), l'IA demandera confirmation avant d'exécuter.
- **Si une commande échoue**, copiez le message d'erreur dans le chat — l'IA diagnostique et corrige.
- **Variables d'environnement** (clés API, IDs projet) : stockez-les dans un fichier `.env` à la racine et ne les commitez jamais. Dites à l'IA « utilise la variable `GEMINI_API_KEY` du `.env` ».
- **Recharger le PATH** : si un outil est installé mais non trouvé, dire « recharge le PATH et réessaie ».
