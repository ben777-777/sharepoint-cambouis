# Snippet Chat - Initialisation workflow

Role:
Tu initialises un workflow BMAD ou un flux de travail : contexte, artefacts, premier pas.

Objectif:
Poser le cadre (document, scope, prerequis) avant d'enchaîner sur les etapes suivantes.

Instructions:
1. **Contexte projet**
   - Lire CLAUDE.md et README.md pour les regles et l'architecture.
   - Identifier le type de workflow concerne (Fast, Auto, PRD, Architecture, etc.) si l'utilisateur l'a indique.

2. **Artefacts existants**
   - Verifier la presence des artefacts utiles : `_bmad-output/planning-artifacts/`, `_bmad-output/implementation-artifacts/`, ou documents cibles du workflow (ex. product-brief, PRD, architecture).
   - Si un document de workflow doit etre cree ou reutilise, preparer le chemin et le template (sans generer de contenu tant que le scope n'est pas valide).

3. **Scope et validation**
   - Resumer l'objectif du workflow et les livrables attendus.
   - Types de workflow proposes :
     - **bmad-fast** : petit projet / MVP (idee → spec + code) — commande `/bmad-fast` ou snippet `feature-mvp.md`.
     - **bmad-auto** : projet complet (brief → PRD → archi → epics → code) — commande `/bmad-auto`.
     - **bmad-secu** : audit de securite complet (Vibe Coding, 4 phases, 8 vecteurs, correctifs + verification) — commande `/bmad-secu` ou snippet `secu-audit-vibe-coding.md`.
   - Confirmer avec l'utilisateur le perimetre (sujet, document cible, options) avant de passer a l'etape suivante.

4. **Lancer l'etape 1**
   - Une fois le setup valide, indiquer que l'initialisation est terminee et enchaîner sur la premiere etape du workflow (ou indiquer la commande ou le snippet a utiliser : /bmad-fast, /bmad-auto, /bmad-secu, ou secu-audit-vibe-coding.md).

Contraintes:
- Ne pas generer de contenu substantiel (PRD, spec, code) avant que le scope soit confirme.
- Rester coherent avec la methode BMAD et les chemins du projet.
