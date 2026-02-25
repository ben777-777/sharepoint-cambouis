# Index des snippets chat

Ce dossier contient des snippets reutilisables a copier-coller dans le chat.

## Snippets disponibles

- `secu-audit.md`  
  Audit securite complet (phase initiale, version courte).

- `secu-audit-vibe-coding.md`  
  Audit securite complet Vibe Coding (equivalent chat de `/bmad-secu`) : 4 phases, 8 vecteurs, rapport + correctifs + verification post-correctifs.

- `secu-post-fix-check.md`  
  Verification post-correctifs (statuts Corrige/Partiel/Non corrige).

- `secu-red-team-pack.md`  
  Batterie de 15 tests d'attaque pour challenger `/bmad-secu`.

- `secu-red-team-runbook.md`  
  Procedure express (10 min) pour executer les tests critiques et decider GO/NO-GO.

- `bug-debug.md`  
  Debug pas a pas, correction minimale et verifiable.

- `code-review.md`  
  Revue code orientee risques/régressions.

- `feature-mvp.md`  
  Construction d'une feature en mini-etapes MVP.

- `continue-autopilot.md`  
  Continue jusqu'au bout sans s'arreter ; prends les meilleurs choix a chaque etape (pas de validation intermediaire).

- `setup-project-sync.md`  
  Nouveau dossier synchronise avec Git remote, verification/installation (Git, Node.js, npm, Docker, etc.), installation BMAD, mise a jour README.md et CLAUDE.md, puis commit.

- `update-push.md`  
  Mise a jour README.md et CLAUDE.md puis git push (point de sauvegarde).

- `workflow-init.md`  
  Initialisation workflow : contexte projet, artefacts existants, scope et validation, puis lancement etape 1.

- `verify-check.md`  
  Verification du travail en cours : etat (OUI/NON), manques, erreurs. Si non termine, corrige et relance. Si termine, affiche le resume des livrables.

## Documentation complementaire (docs/)

- `docs/chat-interactions-guide.md` — Guide : comment interagir dans le chat avec chaque outil (Git, Node, gcloud, MCP Cloud Run, Vercel, pac CLI, Notebook LM, Gemini API, Power Apps/Automate).
- `docs/deploy-frontend-google-ai-studio.md` — Deployer sur Cloud Run depuis Cursor + appel API Gemini.
- `docs/deploy-vercel.md` — Deployer sur Vercel (Git ou CLI).
- `docs/deploy-power-automate.md` — Flows Power Automate (publier, export/import solutions).
- `docs/deploy-power-apps.md` — Apps Power Apps (pac CLI + interface web).
- `docs/notebook-lm-communicate.md` — Notebook LM (gcloud + API REST).
- `docs/cursor-settings.md` — Configuration Cursor (settings.json, rules).

## Routine conseillee pour /bmad-secu

1. Lancer un audit avec `secu-audit.md`
2. Appliquer les correctifs
3. Verifier avec `secu-post-fix-check.md`
4. Challenger la robustesse avec `secu-red-team-pack.md`
5. Lancer la validation release avec `secu-red-team-runbook.md`
