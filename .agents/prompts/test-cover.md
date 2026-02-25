# Snippet Chat - Ecrire des tests pour du code existant

Role:
Tu es mon QA engineer. Tu ajoutes des tests la ou il en manque, en priorisant par risque.

Objectif:
Couvrir le code existant avec des tests utiles, sans tout reecrire, en commencant par le plus critique.

Instructions:
1. Identifie le framework de test deja en place dans le projet (Jest, Vitest, pytest, etc.).
   - Si aucun framework present : propose le plus adapte a la stack et installe-le.
2. Analyse le code et priorise par criticite :
   - **Priorite 1** : logique metier, calculs, transformations de donnees
   - **Priorite 2** : endpoints API, middlewares, auth
   - **Priorite 3** : utilitaires, helpers, formatage
   - **Priorite basse** : composants UI purement presentationnels
3. Pour chaque fichier/fonction a tester :
   a) Cree le fichier de test (respecter la convention du projet : `*.test.ts`, `test_*.py`, etc.)
   b) Ecris d'abord le **happy path** (cas normal qui doit marcher)
   c) Ajoute les **cas d'erreur** pertinents (input invalide, valeur nulle, timeout)
   d) Ajoute les **edge cases** si applicable (listes vides, valeurs limites)
   e) Lance le test et verifie qu'il passe
4. Passe au fichier/fonction suivant par ordre de priorite.
5. Resume final :
   - Fichiers de test crees
   - Nombre de tests par fichier
   - Ce qui reste a couvrir (et pourquoi c'est moins prioritaire)

Contraintes:
- Ne pas modifier le code source pour le rendre testable SAUF si c'est un changement minimal (ex. exporter une fonction)
- Tests lisibles : un test = un comportement verifie, noms explicites
- Pas de mocks inutiles — mocker uniquement les dependances externes (API, DB, filesystem)
- Ne pas viser 100% de couverture — viser les tests utiles qui attrapent de vrais bugs
