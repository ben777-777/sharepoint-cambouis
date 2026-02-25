# Instructions de l'Assistant Claude

Le projet **Sharepoint Cambouis** est propulsé par le framework d'agents **BMAD Fast**. 

## Outils d'Agents Disponibles

Lorsque vous parlez avec l'utilisateur, vous devez avoir accès (via les outils disponibles du projet local) aux commandes :
- **`/bmad-fast`** : Agent de type "Flash", idéal pour passer d'une idée à un petit projet en une seule session.
- **`/bmad-auto`** : Agent de type "Turbo", pour des projets complexes nécessitant une méthodologie rigoureuse de planification, de spécification et d'exécution automatisée étape par étape.
- **`/bmad-secu`** : Agent de sécurité ("Vibe Coding") dédié à  l’audit et l’identification de vulnérabilités potentielles dans l'architecture avant production.

## Bibliothèque de Prompts

Les comportements ponctuels ou snippets (pour orienter une discussion, formater un audit, ou forcer des revues) se trouvent sous `.agents/prompts/` et peuvent être appelés par l’utilisateur via la commande `@[.agents/prompts/fichier.md]`.

## Méthodologie du Projet (Scripting PnP)

* Le projet actuel sert de base pour la **manipulation de SharePoint**.
* L'architecture technique cible pour cela est le module **PnP.PowerShell**.
* Lors de nouveaux scripts ou composants, privilégiez le PowerShell (7.4+) et l'authentification avec `Connect-PnPOnline` via une application "Entra ID". Les identifiants (Tenant, Client ID) ne doivent jamais être codés en dur dans les scripts, mais doivent être passés en paramètres.
* Utiliser les dossiers désignés par la configuration de BMAD Fast (`_bmad-output/` par défaut) pour planifier, concevoir, et documenter l'avancée du projet.
* Ne modifiez *pas* la configuration des agents située dans `_bmad/` à moins que l'utilisateur le demande de façon explicite.
