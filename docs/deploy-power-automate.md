# Déployer dans Microsoft Power Automate

Ce guide décrit les étapes pour **publier** et **déployer** des flows (automatisations) dans **Microsoft Power Automate**. Dans Power Automate, « déployer » recouvre surtout : **mettre un flow en production** (publier et l’activer) et **le déplacer vers un autre environnement** (export/import de solution).

---

## En bref

| Objectif | Action |
|----------|--------|
| **Mettre un flow en service** | Créer le flow → **Publier** → **Activer** (Turn on). |
| **Déplacer vers un autre environnement** (ex. production) | Mettre le flow dans une **solution** → **Exporter** la solution → **Importer** dans l’environnement cible. |

---

## Prérequis

- **Compte Microsoft** (pro ou scolaire pour Power Automate complet).
- Accès à [Power Automate](https://make.powerautomate.com/) (ou via [powerplatform.microsoft.com](https://powerplatform.microsoft.com/)).
- **Environnement** Power Platform (créé automatiquement ou par un admin) pour créer et exécuter les flows.

---

## 1. Créer et publier un flow (mise en service)

1. **Ouvrir Power Automate**  
   Aller sur [make.powerautomate.com](https://make.powerautomate.com/) et se connecter.

2. **Créer un flow (cloud flow)**  
   - **Create** → **Automated cloud flow** (ou **Instant cloud flow**, **Scheduled cloud flow** selon le besoin).  
   - Donner un nom au flow.  
   - Choisir un **déclencheur** (trigger) : manuel, à la création d’un élément, planification, etc.  
   - Ajouter des **actions** (connecteurs : Office 365, SharePoint, HTTP, etc.).  
   - **Save** pour enregistrer en brouillon.

3. **Publier le flow**  
   - Une fois le flow correct : bouton **Publish** (ou **Publish** dans le menu).  
   - Seuls les flows **publiés** sont pris en compte dans les solutions exportées.

4. **Activer le flow**  
   - Après publication, le flow peut être **activé** (**Turn on**).  
   - S’il est désactivé plus tard, le réactiver via **Turn on** depuis la liste des flows.

Une fois publié et activé, le flow est « déployé » dans l’environnement courant (il s’exécute selon son déclencheur).

---

## 2. Déployer vers un autre environnement (export / import)

Pour passer d’un environnement (ex. développement/test) à un autre (ex. production) :

### 2.1 Mettre le flow dans une solution (recommandé)

1. Dans Power Automate : **Solutions** (menu gauche).  
2. **New solution** : nom, éditeur, environnement.  
3. Ouvrir la solution → **Add existing** → **Automation** → **Cloud flow** → sélectionner le(s) flow(s).  
4. **Save** la solution.

### 2.2 Exporter la solution

1. **Solutions** → sélectionner la **solution non managée** (unmanaged) qui contient le flow.  
2. **Export** (ou **…** → **Export**).  
3. Choisir **Publish all changes** pour inclure toutes les dernières versions publiées.  
4. Type d’export : **Unmanaged** (pour retravailler dans l’environnement cible) ou **Managed** (pour distribution verrouillée).  
5. Numéro de version, puis **Export** → télécharger le fichier `.zip`.

Les flows sont contenus dans le zip (dossier Workflows, en JSON).

### 2.3 Importer dans l’environnement cible

1. Se connecter à Power Automate dans **l’environnement cible** (ex. production).  
2. **Solutions** → **Import**.  
3. Sélectionner le fichier `.zip` de la solution exportée.  
4. Suivre l’assistant (résolution des conflits si la solution existe déjà).  
5. Une fois l’import terminé : ouvrir la solution, vérifier les flows, **réactiver** les flows si besoin (Turn on) et **configurer les connexions** si l’environnement cible en demande de nouvelles.

**Points importants :**

- On ne peut pas importer une solution dans un environnement où une solution du même nom existe déjà (même version) ; utiliser une version supérieure ou un autre nom.  
- Les connexions (comptes, API) peuvent devoir être recréées ou partagées dans l’environnement cible.  
- Taille max. du fichier de solution : 95 MB.

---

## 3. Déploiement d’un flow hors solution (package .zip)

Pour un flow **non inclus dans une solution** :

- **Export** : dans la liste des flows, **…** sur le flow → **Export** → **Package (.zip)**.  
- **Import** : dans l’environnement cible, **Import** → **Import package** → sélectionner le `.zip`.

Pour la gestion de plusieurs flows et la traçabilité, privilégier les **solutions**.

---

## 4. Bonnes pratiques avant « production »

- **Tester** le flow en environnement de test (déclencheurs, erreurs, timeouts).  
- **Publish all changes** avant d’exporter la solution.  
- **Ajouter des co-propriétaires** sur les flows critiques.  
- **Documenter** les connexions et paramètres nécessaires dans l’environnement cible.

---

## 5. Vérification

- **Environnement courant** : [make.powerautomate.com](https://make.powerautomate.com/) → **My flows** → le flow est **On** et s’exécute.  
- **Autre environnement** : **Solutions** → solution importée → flows présents et activés, connexions configurées.

---

## Résumé

- **Publier et activer** : le flow est déployé dans l’environnement actuel.  
- **Déployer ailleurs** : solution (flow dedans) → Export (Publish all changes) → Import dans l’environnement cible → activer les flows et gérer les connexions.

Documentation officielle : [Power Automate – Export a solution](https://learn.microsoft.com/en-us/power-automate/export-flow-solution), [Import a solution](https://learn.microsoft.com/en-us/power-automate/import-flow-solution).
