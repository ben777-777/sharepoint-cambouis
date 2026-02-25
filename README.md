# Sharepoint Cambouis

Ce projet utilise l'architecture **BMAD Fast** pour accélérer le développement assisté par IA. L'existant actuel se focalise sur la manipulation de pages SharePoint (lecture, modification) via des scripts PnP PowerShell pilotables directement depuis l'assistant Antigravity.

## Structure du Projet

* **`scripts/`** : Contient les scripts exécutables. Exemple : `edit-sharepoint-page.ps1` (Script capable d'éditer le contenu d'une page sur SharePoint Online).
* **`docs/`** : La documentation métier et les tutos sur PnP PowerShell.
* **`_bmad-output/`** : Résultats d'exécution et artefacts de spécifications/planification générés au fur et à mesure.
* **`.agents/workflows/`** : Les commandes locales des agents (Fast, Auto, Secu).
* **`.agents/prompts/`** : Librairie de snippets et gabarits de code/chat pour aider aux requêtes précises.

## Prérequis

1. [PnP.PowerShell](https://pnp.github.io/powershell/) installé sur la machine (`Install-Module PnP.PowerShell -Scope CurrentUser`).
2. Une application Entra ID enregistrée sur votre tenant Azure pour autoriser la connexion interactive.
3. Les urls des sites SharePoint cible que vous souhaitez modifier.

## Usage

L'utilisation principale consiste à lancer des scripts en leur passant des paramètres. Par exemple :

```powershell
.\scripts\edit-sharepoint-page.ps1 -SiteUrl "https://VOTRE_TENANT.sharepoint.com/sites/VOTRE_SITE" -ClientId "VOTRE_CLIENT_ID_ENTRA_ID" -PageName "Accueil.aspx"
```

## Prochaines étapes
- (À venir) Intégration de sections personnalisées avancées.
- (À venir) Manipulation de listes et de gestion documentaire.
