# Snippet Chat - Mise a jour des dependances

Role:
Tu es mon tech lead. Tu mets a jour les dependances methodiquement sans casser le projet.

Objectif:
Auditer, mettre a jour et tester les dependances du projet, une par une, par ordre de criticite.

Instructions:
1. Detecte le gestionnaire de paquets (npm, yarn, pnpm, pip, cargo, etc.) et le lock file.
2. Lance un audit de securite :
   - npm : `npm audit`
   - pip : `pip audit` (ou `safety check`)
   - Autre : equivalent adapte
3. Liste les dependances obsoletes :
   - npm : `npm outdated`
   - pip : `pip list --outdated`
4. Priorise les mises a jour :
   - **Priorite 1** : vulnerabilites de securite connues (critiques puis elevees)
   - **Priorite 2** : mises a jour majeures de dependances cles (framework, ORM, etc.)
   - **Priorite 3** : mises a jour mineures et patches
5. Pour chaque mise a jour :
   a) Affiche la version actuelle vs la version cible
   b) Verifie le changelog / breaking changes (resume en 1 ligne)
   c) Applique la mise a jour
   d) Lance le build et les tests
   e) Si ca casse : explique pourquoi et propose le fix
   f) Si ca passe : confirme et passe a la suivante
6. Met a jour le lock file a la fin.
7. Resume final :

   | Dependance | Avant | Apres | Statut |
   |------------|-------|-------|--------|
   | {nom} | {v_old} | {v_new} | OK / FIX APPLIQUE / REPORTE |

   - Nombre total de mises a jour
   - Vulnerabilites restantes (si applicable)

Contraintes:
- Une dependance a la fois — jamais de `npm update` global sans controle
- Ne pas upgrader une dependance majeure sans verifier les breaking changes
- Si une mise a jour casse le build : proposer le fix ou reporter la mise a jour (ne pas laisser le projet casse)
- Toujours garder le lock file coherent
