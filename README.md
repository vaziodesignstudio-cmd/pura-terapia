# Pura Terapia® — Agency AI System

Sistema de agência com 16 agents especializados em 4 camadas operacionais, otimizado para gestão de conteúdo de saúde regulada no Brasil.

**Cliente:** Pura Terapia® — telemedicina de cannabis medicinal  
**Agência:** [sua agência]  
**Stack:** Claude Projects + Notion + Meta Business Suite

---

## Estrutura do repositório

```
pura-terapia-agency/
├── README.md
├── sync-agents.sh              ← script de sync para Claude Project
├── AGENTS.md                   ← gerado automaticamente (não editar)
│
├── brand/
│   ├── pura-terapia-branding.md
│   └── Pura_Terapia_Brand_Guidelines_2026.pdf
│
├── agents/
│   ├── 00-INDEX.md
│   ├── layer-1-strategy/
│   │   ├── 01-social-media-strategist.md
│   │   ├── 02-trend-researcher.md
│   │   ├── 03-brand-guardian.md
│   │   ├── 04-sprint-prioritizer.md
│   │   └── 05-agents-orchestrator.md
│   ├── layer-2-production/
│   │   ├── 06-content-creator.md
│   │   ├── 07-visual-storyteller.md
│   │   ├── 08-image-prompt-engineer.md
│   │   ├── 09-whimsy-injector.md
│   │   ├── 10-carousel-growth-engine.md
│   │   └── 11-compliance-reviewer.md
│   ├── layer-3-distribution/
│   │   ├── 12-instagram-curator.md
│   │   ├── 13-tiktok-strategist.md
│   │   ├── 14-seo-specialist.md
│   │   └── 15-support-responder.md
│   └── layer-4-analytics/
│       ├── 16-analytics-reporter.md
│       └── 17-analise-layer.md
│
└── project-instructions/
    └── MASTER-PROMPT.md        ← bloco que vai no Project Instructions do Claude
```

---

## Fluxo de atualização

### Editar um agent

```bash
# 1. edite o .md direto no GitHub (interface web ou local)
vim agents/layer-2-production/06-content-creator.md

# 2. commite
git add .
git commit -m "feat(content-creator): atualiza fórmula de caption EDUCA"
git push
```

### Sincronizar com Claude Project

```bash
# 3. rode o script na raiz do repo
./sync-agents.sh

# 4. faça upload do AGENTS.md gerado no Claude Project Knowledge
# claude.ai → projeto → Project Knowledge → Add content → cole ou faça upload
```

> O arquivo `AGENTS.md` é sempre **sobrescrito** pelo script. Nunca edite ele diretamente.

---

## Arquitetura de Claude Projects

| O que vai no Project Knowledge | O que vai no Project Instructions |
|---|---|
| `AGENTS.md` (gerado pelo script) | `MASTER-PROMPT.md` (contexto de marca + regras operacionais) |
| `pura-terapia-branding.md` | — |
| `Pura_Terapia_Brand_Guidelines_2026.pdf` | — |

**Project Knowledge** = base de conhecimento dos agents (quem são, o que fazem, como operam)  
**Project Instructions** = contexto permanente que o Claude carrega em toda conversa

---

## Convenção de commits

```
feat(agent-name): descrição da mudança
fix(agent-name): correção
refactor(agent-name): reestruturação sem mudança de comportamento
docs: atualização de README ou documentação
brand: mudança em arquivos de identidade
```
