# Communiquer avec Notebook LM

Ce guide decrit les etapes pour **utiliser** et **piloter** **Notebook LM** (Google) : version grand public (web) et **NotebookLM Enterprise** (Google Cloud) via **gcloud CLI + API REST** — la methode recommandee pour piloter depuis Cursor. La conversation avec le LLM se fait dans le navigateur ; les operations de gestion (creer notebook, ajouter sources) se font via l'API.

---

## En bref

| Contexte | Methode recommandee |
|----------|----------------------|
| **Notebook LM (grand public)** | [notebooklm.google.com](https://notebooklm.google.com) → creer un notebook → ajouter des sources → chat. |
| **NotebookLM Enterprise (CLI/API)** | `gcloud auth login` → appels `curl` REST pour creer notebooks et ajouter sources → conversation dans le navigateur. |
| **Chat depuis du code (non officiel)** | Librairies tierces (`notebooklm-py`, `notebooklm-kit`) — pour prototypage uniquement. |

---

## 1. Notebook LM (version grand public) — utilisation web

1. Aller sur [notebooklm.google.com](https://notebooklm.google.com) et se connecter avec un compte Google.
2. **Create New** pour creer un notebook.
3. **Ajouter des sources** : PDF, Google Docs, Google Sheets, liens web, YouTube, texte colle (limite : ~30 sources en gratuit, plus avec NotebookLM Plus).
4. Utiliser la **zone de chat** pour poser des questions — les reponses s'appuient uniquement sur les sources ajoutees.
5. Fonctions utiles : notes, actions rapides (FAQ, resume, plan), Audio Overview, export vers Google Docs.

---

## 2. NotebookLM Enterprise — gcloud CLI + API REST (recommande depuis Cursor)

Pour piloter Notebook LM par programme, on utilise **gcloud** pour l'authentification et **curl** pour les appels REST.

### Prerequis

- Projet Google Cloud avec **NotebookLM Enterprise** configure et licences associees.
- **Google Cloud SDK (gcloud)** installe et configure (voir setup-project-sync.md, etape 2).
- Documentation : [NotebookLM Enterprise – Set up](https://cloud.google.com/gemini/enterprise/notebooklm-enterprise/docs/set-up-notebooklm), [API notebooks](https://cloud.google.com/gemini/enterprise/notebooklm-enterprise/docs/api-notebooks).

### 2.1 Authentification

```powershell
# Connexion standard
gcloud auth login

# Avec acces Google Drive (necessaire pour ajouter des sources Google Docs / Slides)
gcloud auth login --enable-gdrive-access

# Recuperer un token OAuth pour les appels REST
gcloud auth print-access-token
```

### 2.2 Creer un notebook

```powershell
curl -X POST \
  -H "Authorization: Bearer $(gcloud auth print-access-token)" \
  -H "Content-Type: application/json" \
  "https://REGION-discoveryengine.googleapis.com/v1alpha/projects/PROJECT_NUMBER/locations/LOCATION/notebooks" \
  -d '{"title": "MON_NOTEBOOK"}'
```

Valeurs pour `REGION` / `LOCATION` : `global`, `eu`, ou `us`.

La reponse contient le `notebookId` a utiliser pour les etapes suivantes.

### 2.3 Ajouter des sources

```powershell
curl -X POST \
  -H "Authorization: Bearer $(gcloud auth print-access-token)" \
  -H "Content-Type: application/json" \
  "https://REGION-discoveryengine.googleapis.com/v1alpha/projects/PROJECT_NUMBER/locations/LOCATION/notebooks/NOTEBOOK_ID/sources:batchCreate" \
  -d '{
    "requests": [
      {"source": {"webUri": "https://example.com/article"}},
      {"source": {"youtubeUri": "https://www.youtube.com/watch?v=XXXXX"}}
    ]
  }'
```

**Types de sources supportes** : `webUri`, `youtubeUri`, `googleDocUri`, `googleSlideUri`, `rawText`, fichiers PDF/audio/image (upload). Limite : 50 sources par notebook, 500 000 mots ou 200 MB par source.

### 2.4 Autres operations via API

| Operation | Methode |
|-----------|---------|
| Recuperer un notebook | `GET .../notebooks/NOTEBOOK_ID` |
| Lister les notebooks recents | `GET .../notebooks:listRecentlyViewed` |
| Partager un notebook | `POST .../notebooks/NOTEBOOK_ID:share` avec emails et roles |
| Supprimer des notebooks | `POST .../notebooks:batchDelete` |
| Generer un Audio Overview | `POST .../notebooks/NOTEBOOK_ID/audioOverviews` |

### 2.5 Acceder a la conversation (navigateur)

Apres avoir cree le notebook et ajoute les sources via API, la **conversation** (chat) avec le LLM se fait dans le navigateur :

```
# Identite Google :
https://notebooklm.cloud.google.com/LOCATION/notebook/NOTEBOOK_ID?project=PROJECT_NUMBER

# Identite tierce :
https://notebooklm.cloud.google/LOCATION/notebook/NOTEBOOK_ID?project=PROJECT_NUMBER
```

**Limitation connue** : il n'existe pas d'API officielle Google pour envoyer un message de chat et recevoir la reponse du LLM depuis du code. L'API gere les notebooks et leurs sources ; la conversation reste dans le navigateur.

---

## 3. Chat depuis du code (options non officielles)

Des projets communautaires permettent d'envoyer des messages de chat par programme via des APIs **non documentees** de Google. A utiliser avec prudence (peuvent casser, non supportes officiellement).

- **notebooklm-py** (Python) : envoi de questions, historique de conversation.
- **notebooklm-kit** (TypeScript) : methodes `chat()` / `chatStream()`.
- **notebooklm-mcp** : serveur MCP avec mode chat (`chat --message`).

A reserver au **prototypage** ou a un **usage personnel**.

---

## Resume

| Objectif | Methode |
|----------|---------|
| **Utiliser le chat** | Navigateur : notebooklm.google.com ou notebooklm.cloud.google.com |
| **Creer et configurer un notebook par programme** | `gcloud auth login --enable-gdrive-access` → `curl POST .../notebooks` → `curl POST .../sources:batchCreate` |
| **Chat depuis du code** | Pas d'API officielle ; librairies tierces pour prototypage |

Documentation officielle : [Notebook LM Help](https://support.google.com/notebooklm), [NotebookLM Enterprise API – notebooks](https://cloud.google.com/gemini/enterprise/notebooklm-enterprise/docs/api-notebooks), [API – sources](https://cloud.google.com/gemini/enterprise/notebooklm-enterprise/docs/api-notebooks-sources).
