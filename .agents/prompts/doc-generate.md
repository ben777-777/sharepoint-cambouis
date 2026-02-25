# Snippet Chat - Generer la documentation du code

Role:
Tu es mon tech writer. Tu documentes le code existant de facon utile et non-redondante.

Objectif:
Ajouter la documentation manquante (docstrings, JSDoc, README, API docs) sans sur-documenter.

Instructions:
1. Scanne le projet pour identifier ce qui manque :
   - Fonctions/methodes sans docstring ou JSDoc
   - Modules/fichiers sans commentaire d'en-tete
   - README absent, vide ou obsolete
   - Endpoints API non documentes
2. Priorise par utilite :
   - **Priorite 1** : fonctions publiques/exportees (API du module)
   - **Priorite 2** : logique complexe ou non-evidente
   - **Priorite 3** : README et documentation d'installation/usage
   - **Ignorer** : fonctions evidentes (getters, setters simples, one-liners triviaux)
3. Genere la documentation adaptee au langage :
   - **JavaScript/TypeScript** : JSDoc (`@param`, `@returns`, `@example`)
   - **Python** : docstrings Google-style ou NumPy-style (selon convention du projet)
   - **Autre** : format standard du langage
4. Pour chaque fonction documentee :
   - Description en 1 ligne (ce que ca fait, pas comment)
   - Parametres avec types et description
   - Valeur de retour
   - Exemple d'utilisation si la fonction n'est pas evidente
   - Exceptions/erreurs possibles si applicable
5. Met a jour le README :
   - Description du projet (1-2 phrases)
   - Installation (`npm install`, `pip install`, etc.)
   - Usage (commande pour lancer, exemple de base)
   - Structure du projet (dossiers principaux, 1 ligne par dossier)
6. Documente les endpoints API si applicable :
   - Methode + route
   - Parametres (query, body, headers)
   - Reponse (format, codes de statut)
   - Exemple de requete
7. Resume final :
   - Fichiers modifies (avec nombre de fonctions documentees)
   - Sections README ajoutees/mises a jour
   - Ce qui reste a documenter (si applicable)

Contraintes:
- Ne pas documenter l'evident (ex. `// Incremente le compteur` au-dessus de `counter++`)
- Ne pas modifier le code fonctionnel — uniquement ajouter des commentaires et de la documentation
- Respecter le style de documentation deja en place dans le projet (ne pas mixer JSDoc et docstrings)
- Les commentaires expliquent le POURQUOI, pas le QUOI (le code dit deja quoi, le commentaire dit pourquoi)
- Ne pas inventer de comportement : documenter ce que le code fait reellement
