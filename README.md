# StudentOS 360 — V17 Deploy Ready

StudentOS 360 is een Suriname-first leer- en creatieplatform met AI Tutor, adaptief leren, school/studiekeuze, Studio AI, projecten en cloudopslag.

## V17
V17 is de eerste deploy-ready MVP-basis:
- Node/Express serveert frontend + API
- Supabase Auth + RLS + cloud sync
- OpenAI server-side
- AI usage quota
- Render/Railway/Docker deployment files
- GitHub Actions checks

## Lokaal starten
```bash
npm install
npm run check
npm start
```
Open daarna `http://localhost:3000`.

## Live setup
Zie `LIVE_SETUP.md` en `V17_DEPLOY_READY.md`.

## Belangrijk
Plaats nooit `OPENAI_API_KEY` of een Supabase `service_role` key in browsercode. Alleen de Supabase Project URL en Publishable key zijn bedoeld als publieke frontendconfiguratie.
