# Snippet Chat - Setup projet + sync Git + installations

Role:
Tu prepares un nouveau dossier projet synchronise avec un depot Git distant et tu verifies/installe les outils necessaires.

Objectif:
Avoir un projet pret a travailler : dossier cree, Git lie au remote, environnement verifie, BMAD et docs a jour, puis commit.

Instructions:
1. **Dossier et Git**
   - Creer le dossier projet (ou utiliser le repertoire courant si deja cible).
   - Initialiser Git si besoin (`git init`), ajouter le remote et faire un premier pull, ou cloner le repo distant dans le dossier cible.
   - S'assurer que le dossier est bien synchronise avec le remote (branch suivie, pas de conflit non resolu).

2. **Verifier ET installer automatiquement les outils manquants (Windows PowerShell)**

   Verifier chaque outil et l'installer si absent :

   **Git** : `git --version`
   - Si absent : telecharger sur [git-scm.com](https://git-scm.com/download/win) (installation manuelle requise).

   **Node.js (v20+)** : `node --version`
   - Sur cette machine, Node.js est installe dans :
     `C:\Users\B_ARNAUD\Documents\Perso\Cursor Projects\Nodejs\node-v22.22.0-win-x64`
   - Si absent du PATH, ajouter au PATH utilisateur :
     ```powershell
     $nodePath = "C:\Users\B_ARNAUD\Documents\Perso\Cursor Projects\Nodejs\node-v22.22.0-win-x64"
     $userPath = [System.Environment]::GetEnvironmentVariable("PATH", "User")
     if ($userPath -notlike "*$nodePath*") {
       [System.Environment]::SetEnvironmentVariable("PATH", "$userPath;$nodePath", "User")
     }
     $env:PATH += ";$nodePath"
     node --version
     ```
   - Si Node n'est pas installe du tout : telecharger sur [nodejs.org](https://nodejs.org/) (LTS, option "Add to PATH" cochee), installer dans `C:\Users\B_ARNAUD\Documents\Perso\Cursor Projects\Nodejs\`, puis appliquer le bloc ci-dessus.
   - Ne pas installer via winget sans verification prealable (risque d'installer dans OneDrive ou un dossier systeme).

   **npm** : `npm --version` (inclus avec Node.js)

   **Google Cloud SDK (gcloud)** : `gcloud --version`
   - Si absent, installer via winget (ne requiert pas de droits admin) :
     ```powershell
     winget install Google.CloudSDK
     # Puis fermer et rouvrir le terminal, ou recharger le PATH :
     $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "User") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "Machine")
     gcloud init
     ```
   - Ou telecharger l'installeur : [cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install)

   **Vercel CLI** : `vercel --version`
   - Si absent (et npm disponible) : `npm i -g vercel`

   **.NET SDK (v10+)** (requis pour pac CLI) : `dotnet --version`
   - Si absent ou version < 10 : installer via winget :
     ```powershell
     winget install Microsoft.DotNet.SDK.10
     $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "User") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "Machine")
     dotnet --version
     ```

   **Power Platform CLI (pac)** : `pac --version`
   - Si absent (et .NET 10+ disponible) :
     ```powershell
     dotnet tool install --global Microsoft.PowerApps.CLI.Tool
     pac --version
     ```

   **Docker** (si pertinent) : `docker --version`
   - Si absent : [docker.com/get-started](https://www.docker.com/get-started) (installation manuelle).

   Autres selon le projet : Python, pnpm/yarn, etc.
   Pour les outils necessitant une installation graphique ou des droits admin : proposer le lien et les etapes, ne pas supposer qu'ils sont installes.

3. **Installer BMAD** (si applicable au projet)
   - Dans le dossier projet : `npx bmad-method install --modules bmm --tools cursor --yes`
   - Si le repo BMAD Fast/Auto doit etre integre : utiliser `install-bmad-fast.sh` ou copie manuelle des agents/workflows/commands comme dans le README du repo BMAD Fast.

4. **Mettre a jour README.md et CLAUDE.md**
   - Adapter `README.md` au projet (nom, description, prerequis, installation, usage).
   - Adapter `CLAUDE.md` au contexte (regles IA, commandes utiles, architecture du projet). Creer les fichiers s'ils n'existent pas.

5. **Commit et push**
   - `git add` des fichiers modifies (README.md, CLAUDE.md, fichiers BMAD ajoutes, etc.), message de commit clair, puis `git push` vers le remote si la branche est deja poussee.

6. **Optionnel : deploiement frontends vers Google Cloud Run (depuis Cursor)**
   - Si le projet prevoit de deployer des frontends sur la meme infra que Google AI Studio (Cloud Run) : voir `docs/deploy-frontend-google-ai-studio.md`.
   - Verifier que **gcloud** est installe et authentifie : `gcloud auth login` puis `gcloud auth application-default login`.
   - Definir le projet GCP : `gcloud config set project MY_PROJECT_ID` ; activer l'API : `gcloud services enable run.googleapis.com`.
   - S'assurer que le MCP Cloud Run est configure (ex. `.cursor/mcp.json` avec `cloud-run` via `npx -y @google-cloud/cloud-run-mcp`). Redemarrer Cursor apres modification. Ensuite, depuis le chat : demander par ex. « Deploie le dossier X sur Cloud Run » (outil `deploy-local-folder`).

7. **Optionnel : deploiement frontends vers Vercel**
   - Si le projet prevoit de deployer des frontends sur Vercel : voir `docs/deploy-vercel.md`.
   - **Via Git (recommandé)** : compte sur [vercel.com](https://vercel.com) → Add New → Project → importer le repo (GitHub/GitLab/Bitbucket) → configurer root/framework/build → Deploy ; chaque push declenche un deploiement (preview ou production).
   - **Via CLI** : verifier `vercel --version` (sinon `npm i -g vercel`). Dans le dossier frontend : `vercel` (premier lien au projet), puis `vercel --prod` pour la production. Optionnel : `vercel git connect` pour lier le repo au projet Vercel.

8. **Optionnel : deploiement flows Microsoft Power Automate**
   - Si le projet prevoit des automatisations Power Automate : voir `docs/deploy-power-automate.md`.
   - **Mise en service** : [make.powerautomate.com](https://make.powerautomate.com/) → Create → Automated cloud flow → definir trigger et actions → Save → **Publish** → **Turn on**.
   - **Deploiement vers un autre environnement** : mettre le flow dans une **Solution** (Solutions → New solution → Add existing → Cloud flow) → **Export** la solution (Publish all changes) → dans l’environnement cible : **Solutions** → **Import** → selectionner le .zip → activer les flows et configurer les connexions.

9. **Deploiement apps Microsoft Power Apps (pac CLI)**
   - Voir `docs/deploy-power-apps.md`. Necessite **pac CLI** (verifier etape 2).
   - **Auth** : `pac auth create --environment https://ORG.crm.dynamics.com` (remplacer ORG par l'URL de l'environnement Power Platform).
   - **Exporter** une solution : `pac solution export --name NOM_SOLUTION --path ./solution.zip`
   - **Importer** dans l'environnement cible : `pac auth create --environment https://ORG-CIBLE.crm.dynamics.com` puis `pac solution import --path ./solution.zip`
   - **Publier** les customizations : `pac solution publish`
   - Pour integrer l'app dans une solution avant export (si pas encore fait) : [make.powerapps.com](https://make.powerapps.com/) → Solutions → New solution → Add existing → App → Save.

10. **Communiquer avec Notebook LM (gcloud CLI + API REST)**
   - Voir `docs/notebook-lm-communicate.md`. Necessite **gcloud** (verifier etape 2).
   - **Auth** : `gcloud auth login --enable-gdrive-access` (ajoute l'acces Google Drive pour les sources Docs/Slides).
   - Recuperer un token : `gcloud auth print-access-token`
   - **Creer un notebook** : `curl -X POST -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json" "https://REGION-discoveryengine.googleapis.com/v1alpha/projects/PROJECT_NUMBER/locations/LOCATION/notebooks" -d '{"title": "MON_NOTEBOOK"}'`
   - **Ajouter des sources** (PDF, URL, Docs, YouTube...) : `curl -X POST .../notebooks/NOTEBOOK_ID/sources:batchCreate` avec les sources en JSON.
   - La **conversation** avec le LLM se fait dans le navigateur (notebooklm.google.com ou notebooklm.cloud.google.com pour Enterprise) ; pas d'API officielle de chat depuis le code.

Reference des guides (docs/) :
   - `docs/deploy-frontend-google-ai-studio.md` — Cloud Run (depuis Cursor, MCP), appel API Gemini depuis le projet.
   - `docs/deploy-vercel.md` — Frontends sur Vercel (Git ou CLI).
   - `docs/deploy-power-automate.md` — Flows Power Automate (publier, export/import solutions).
   - `docs/deploy-power-apps.md` — Apps Power Apps (publier, partager, export/import solutions).
   - `docs/notebook-lm-communicate.md` — Communiquer avec Notebook LM (web, Enterprise API, options non officielles).

Contraintes:
- Ne pas supprimer de contenu existant sans demande explicite ; seulement ajouter ou adapter.
- Si une action requiert GitHub Desktop ou un logiciel graphique : donner le lien et les etapes, ne pas supposer qu'il est installe.
- Rester coherent avec la methode BMAD et la structure du repo (voir CLAUDE.md et README du projet).
