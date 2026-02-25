# Instructions de l'Assistant Claude

Le projet **Sharepoint Cambouis** est propulsé par le framework d'agents **BMAD Fast**. 

## Outils d'Agents Disponibles

Lorsque vous parlez avec l'utilisateur, vous devez avoir accès (via les outils disponibles du projet local) aux commandes :
- **`/bmad-fast`** : Agent de type "Flash", idéal pour passer d'une idée à un petit projet en une seule session.
- **`/bmad-auto`** : Agent de type "Turbo", pour des projets complexes nécessitant une méthodologie rigoureuse de planification, de spécification et d'exécution automatisée étape par étape.
- **`/bmad-secu`** : Agent de sécurité ("Vibe Coding") dédié à  l’audit et l’identification de vulnérabilités potentielles dans l'architecture avant production.

## Méthodologie

* Utiliser les dossiers désignés par la configuration de BMAD Fast (`_bmad-output/` par défaut) pour planifier, concevoir, et documenter l'avancée du projet.
* Tous les snippets et templates (qui peuvent aider la conversation ou orienter le code) sont listés sous `.agents/prompts/` (soit les équivalents des chats Cursor convertis).
* Ne modifiez *pas* la configuration des agents située dans `_bmad/` à moins que l'utilisateur le demande de façon explicite.
