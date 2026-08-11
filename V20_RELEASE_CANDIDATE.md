# StudentOS 360 — V20 Release Candidate

V20 is de stap tussen Public Beta en StudentOS 1.0.

## Afgehandeld
- V19 Studio AI `req` scope-bug gerepareerd.
- Free / Plus / Pro blijven server-side afgedwongen.
- Daglimieten + maandelijkse AI fair-use/kostenbescherming.
- Minderjarigenbescherming: profielen <13 blokkeren live OpenAI zolang Zero Data Retention niet expliciet server-side bevestigd is.
- Voor minderjarigen kiest de backend het actuele GPT-5.6 flagship-model.
- Inputmoderatie, safety identifiers en `store:false` blijven actief.
- Account consent records voor Voorwaarden/Privacy.
- Safety reporting in Profiel.
- Wachtwoord reset flow.
- Server-side account deletion zodra Supabase service-role secret op Render staat.
- Privacy-, voorwaarden-, safety- en betaalpagina's.
- Paddle Billing sandbox-integratie met signed webhooks en idempotency.
- Nieuwe abonnementen worden uitsluitend na een geverifieerde Paddle webhook gesynchroniseerd.

## AI fair use
Productdefaults:
- Free: 100 tekst / 8 images per dag, maandelijkse AI-kostenrem circa $0.75.
- Plus: 350 tekst / 25 images per dag, maandelijkse AI-kostenrem circa $2.25.
- Pro: 1000 tekst / 60 images per dag, maandelijkse AI-kostenrem circa $4.50.

De maandbedragen zijn interne kostenremmen, geen klanttegoed of gegarandeerde waarde.

## Nog extern te configureren vóór echte betalingen
Render server secrets:
- `SUPABASE_SERVICE_ROLE_KEY`
- `PADDLE_API_KEY`
- `PADDLE_CLIENT_TOKEN`
- `PADDLE_WEBHOOK_SECRET`
- `PADDLE_PLUS_PRICE_ID`
- `PADDLE_PRO_PRICE_ID`

Start met `PADDLE_ENV=sandbox`.

`OPENAI_ZERO_DATA_RETENTION_CONFIRMED` moet `false` blijven tenzij Zero Data Retention daadwerkelijk voor de relevante OpenAI-organisatie/verwerking is ingesteld.

## Wanneer 1.0?
Noem StudentOS pas 1.0 Official wanneer:
1. live Render-deploy groen is;
2. signup/login/reset/delete getest zijn;
3. cloud sync en mastery getest zijn;
4. alle AI-routes live werken;
5. Paddle sandbox checkout + webhook werken;
6. daarna seller/domain verification en live checkout zijn afgerond;
7. voorwaarden/privacy formeel juridisch zijn beoordeeld voor de markten waarin je commercieel lanceert.
