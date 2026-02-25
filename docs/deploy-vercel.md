# Déployer des frontends sur Vercel

Ce guide décrit les étapes pour déployer une application frontend (Next.js, React, Vue, HTML statique, etc.) sur **Vercel** depuis votre machine ou depuis Cursor. Vercel propose des déploiements automatiques via Git et un déploiement manuel via la CLI.

---

## En bref

| Méthode | Quand l’utiliser |
|--------|-------------------|
| **Git (recommandé)** | Repo déjà sur GitHub/GitLab/Bitbucket : chaque push déclenche un déploiement (preview ou production). |
| **CLI** | Déploiement immédiat depuis le terminal (ou depuis Cursor) sans passer par Git. |

Les deux donnent une **URL HTTPS** (preview et/ou production).

---

## Prérequis

- **Compte Vercel** — [vercel.com](https://vercel.com) (gratuit)
- **Node.js** (pour la CLI) — [nodejs.org](https://nodejs.org/)
- Pour le flux **Git** : dépôt sur GitHub, GitLab, Bitbucket ou Azure DevOps

---

## Méthode 1 : Déploiement via Git (recommandé)

1. **Connecter le dépôt à Vercel**
   - Aller sur [vercel.com](https://vercel.com) → **Add New…** → **Project**
   - Importer le dépôt Git (GitHub / GitLab / Bitbucket)
   - Choisir le repo et la branche (souvent `main` pour la production)

2. **Configurer le projet**
   - **Root Directory** : laisser tel quel si le frontend est à la racine, sinon indiquer le sous-dossier (ex. `frontend/`, `app/`)
   - **Framework Preset** : Vercel détecte en général Next.js, React, Vue, etc. ; ajuster si besoin
   - **Build Command** / **Output Directory** : laisser les valeurs par défaut ou les adapter (ex. `npm run build`, `out` ou `dist`)

3. **Déployer**
   - Cliquer sur **Deploy**
   - Chaque **push** sur une branche crée une **preview** ; les merges sur la branche de production (ex. `main`) créent un déploiement **production**

4. **Optionnel : lier Git depuis la CLI**
   - En local, à la racine du projet : `vercel git connect`
   - Cela associe le repo Git au projet Vercel existant

---

## Méthode 2 : Déploiement via la CLI (depuis Cursor ou terminal)

1. **Installer la CLI Vercel**
   ```bash
   npm i -g vercel
   ```
   Ou avec pnpm / yarn : `pnpm add -g vercel` / `yarn global add vercel`

2. **Se placer dans le dossier du frontend**
   ```bash
   cd chemin/vers/mon-frontend
   ```

3. **Premier déploiement (liaison au projet)**
   ```bash
   vercel
   ```
   - Connexion ou inscription si demandé
   - Répondre aux questions : lien au projet existant ou nouveau projet, organisation, etc.
   - Un dossier `.vercel` est créé (à ajouter dans `.gitignore` si vous ne voulez pas le versionner)

4. **Déploiement en production**
   ```bash
   vercel --prod
   ```
   À utiliser après un déploiement de test réussi avec `vercel`.

---

## Étapes récap (ordre pratique)

| Étape | Action |
|-------|--------|
| 1 | Créer un compte Vercel et (pour Git) pousser le code sur GitHub/GitLab/Bitbucket |
| 2 | **Git** : Vercel → Add New → Project → importer le repo → configurer root/framework/build → Deploy |
| 2 bis | **CLI** : `npm i -g vercel` → `cd mon-frontend` → `vercel` puis `vercel --prod` |
| 3 | Récupérer l’URL de preview et l’URL de production dans le dashboard ou en sortie de CLI |

---

## Vérification

- **Dashboard** : [vercel.com/dashboard](https://vercel.com/dashboard) → votre projet → onglet **Deployments**
- **CLI** : la commande `vercel` ou `vercel --prod` affiche l’URL du déploiement à la fin

---

## Résumé

- **Git** : une fois le repo connecté, les déploiements sont automatiques à chaque push.
- **CLI** : déploiement manuel rapide depuis le terminal (ou depuis Cursor en lançant les commandes dans le terminal intégré).

Pour plus de détails : [Documentation Vercel – Deployments](https://vercel.com/docs/deployments).
