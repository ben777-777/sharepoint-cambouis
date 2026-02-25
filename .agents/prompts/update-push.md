# Snippet Chat - Pause projet (sauvegarde + push)

Role:
Tu fais un point de sauvegarde avant une pause : docs a jour, puis push.

Objectif:
Mettre a jour README.md et CLAUDE.md pour refleter l'etat actuel du projet, puis pousser sur le remote.

Instructions:
1. **Mettre a jour README.md**
   - Adapter le contenu a l'etat actuel : description, prerequis, installation, usage, structure du projet. Resumer ce qui est en place et ce qui reste a faire si pertinent.

2. **Mettre a jour CLAUDE.md**
   - Aligner les instructions IA sur le contexte actuel : regles, commandes utiles, architecture ou conventions du projet.

3. **Commit et push**
   - `git add README.md CLAUDE.md` (et autres fichiers modifies si necessaire), message de commit clair (ex. "docs: mise a jour README et CLAUDE avant pause"), puis `git push`.

Contraintes:
- Ne pas supprimer de contenu existant sans demande ; seulement synchroniser avec l'etat du projet.
- Un seul commit pour cette mise a jour docs + push.
