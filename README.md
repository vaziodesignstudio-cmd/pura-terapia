# Pura Terapia® · Agency AI System

Sistema de agência com 16 agents especializados em 4 camadas operacionais, montado para gestão de conteúdo de saúde regulada no Brasil.

**Cliente:** Pura Terapia® (telemedicina de cannabis medicinal)
**Agência:** Vazio Design Studio
**Stack:** Claude Projects, Notion, Meta Business Suite

---

## Estrutura do repositório

```
pura-terapia/
├── README.md
├── AGENTS.md                       (gerado por sync-agents.sh, não editar manualmente)
├── sync-agents.sh                  (compila todos os agents num arquivo único)
│
├── agents/                         (a operação inteira em 16 arquivos .md)
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
├── brand/                          (identidade visual e assets oficiais)
│   ├── pura-terapia-branding.md
│   └── assets/
│       ├── logo-app-icon.svg       (versão avatar oficial, vetorial)
│       ├── logo-icon-on-light.png  (ícone em verde escuro sobre transparente)
│       ├── logo-icon-on-dark.png   (ícone em verde lima sobre transparente)
│       └── logo-wordmark-on-dark.png
│
└── outputs/                        (entregáveis e bancos de conteúdo)
    ├── banco-reels-m3.md           (banco de Reels com médicos para julho/2026)
    ├── relatorio-mes-01.html       (template aprovado de relatório mensal)
    └── relatorio-mes-01.pdf
```

---

## As 4 camadas da operação

| Camada | Foco | Agents |
|---|---|---|
| 1. Estratégia | Calendário, posicionamento, prioridades | 01 a 05 |
| 2. Produção | Texto, visual, compliance | 06 a 11 |
| 3. Distribuição | Plataformas e comunidade | 12 a 15 |
| 4. Análise | Performance, feedback, relatórios | 16 e 17 |

Cada agent tem identidade, contexto de marca, responsabilidades, processo e métricas de sucesso. Os agents conversam entre si pelos outputs definidos em cada arquivo.

---

## Fluxo de atualização

### Editar um agent

```bash
vim agents/layer-2-production/06-content-creator.md
git add .
git commit -m "feat(content-creator): atualiza fórmula de caption EDUCA"
git push
```

### Sincronizar com Claude Project

```bash
./sync-agents.sh
```

O script regrava o `AGENTS.md` a partir de todos os arquivos da pasta `agents/`. Depois é só fazer upload do arquivo gerado no Claude Project Knowledge.

> `AGENTS.md` é sempre sobrescrito pelo script. Nunca edite ele diretamente.

---

## Arquitetura de Claude Projects

| Project Knowledge | Project Instructions |
|---|---|
| `AGENTS.md` (gerado pelo script) | `MASTER-PROMPT.md` |
| `brand/pura-terapia-branding.md` | |
| `brand/assets/` (quando o Claude precisar dos assets oficiais) | |

**Project Knowledge:** base de conhecimento dos agents (quem são, o que fazem, como operam).
**Project Instructions:** contexto permanente que o Claude carrega em toda conversa.

---

## brand/assets/

Assets visuais oficiais para uso em qualquer material gerado (relatórios, posts, briefings, artes).

Os arquivos foram exportados do Figma oficial (`figma.com/design/6ZMMyXiFge9PNbAxkhVKGz`, node `88:1196`) e ficam versionados aqui para facilitar a integração com geradores de PDF, scripts de exportação e agents que precisam montar peças visuais.

Preferir sempre `logo-app-icon.svg` quando o formato permitir: é vetorial e escala sem perda em qualquer tamanho.

---

## outputs/

Pasta para conteúdo derivado da operação: relatórios, bancos de pauta e materiais aprovados que servem de molde para entregas futuras.

| Arquivo | Função |
|---|---|
| `relatorio-mes-01.html` e `.pdf` | Análise do mês 1 (soft launch, maio/2026). É o molde aprovado para todos os relatórios mensais futuros, replicar estrutura e estética. |
| `banco-reels-m3.md` | Banco de 8 Reels com médicos parceiros, pronto para entrar no calendário de julho/2026. |

---

## Convenção de commits

```
feat(agent-name): descrição da mudança
fix(agent-name): correção
refactor(agent-name): reestruturação sem mudança de comportamento
docs: atualização de README ou documentação
brand: mudança em arquivos de identidade ou assets
content: novo material em outputs/
```
