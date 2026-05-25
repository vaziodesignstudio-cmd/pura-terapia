# Dados de Instagram · Pura Terapia®

Pasta de dados oficiais exportados do Meta Business Suite mês a mês. É a fonte de verdade dos relatórios mensais e das decisões editoriais.

## Estrutura

```
data/instagram/
└── AAAA-MM/                       (uma pasta por mês de operação)
    ├── alcance.csv                (alcance diário)
    ├── visualizacoes.csv          (visualizações diárias)
    ├── interacoes.csv             (curtidas + comentários + saves + shares por dia)
    ├── visitas.csv                (visitas ao perfil por dia)
    ├── cliques-no-link.csv        (cliques no link da bio por dia)
    ├── seguidores.csv             (novos seguidores ganhos por dia)
    ├── posts.csv                  (lista de posts do mês com métricas individuais)
    └── _analyze.py                (script de carga e análise rápida)
```

## Formato dos CSVs

Todos os CSVs diários seguem o mesmo schema:
```
data,valor
2026-05-04,907
2026-05-05,336
...
```

O `posts.csv` tem schema próprio:
```
titulo,data,hora,tipo,views,alcance,curtidas,shares,follows,comments,saves
```

Onde `tipo` é "Carrossel", "Imagem", "Reel" ou "Story".

## Fluxo mensal

No final de cada mês (24 do mês N, conforme o ciclo de 28 dias do Instagram):

1. **No Business Suite web** (business.facebook.com): exportar os CSVs diários de cada métrica usando o filtro "Últimos 28 dias".
2. **Salvar em `data/instagram/AAAA-MM/`** convertendo de UTF-16 LE (que o Business Suite gera) para UTF-8 limpo. Usar o esquema `data,valor` consistente.
3. **No app do Instagram**: tirar prints da seção "Conteúdo" com a lista completa de posts do mês mostrando saves, shares e comentários, e transformar em `posts.csv` na pasta.
4. **Rodar `_analyze.py`** para verificar consistência dos totais antes de alimentar o relatório.

## Por que isso existe

Antes de maio/2026 a operação dependia de screenshots, que perdem a granularidade do nível de post. Os CSVs versionados aqui dão ao Analytics Reporter (agent 16) e ao Experiment Tracker (agent 17) acesso a dados estruturados, comparáveis mês a mês.

## Limitações conhecidas

- **Cliques no link da bio**: o Business Suite só rastreia se o link estiver configurado como link nativo do Instagram. Se for Linktree, Beacons ou similar, os cliques não aparecem aqui (precisam ser puxados na ferramenta agregadora).
- **Alcance diário somado ≠ alcance único mensal**: o mensal deduplica usuários alcançados em vários dias. Para comparar com o painel do Instagram, usar o número do painel, não a soma diária.
- **Stories**: o Business Suite não exporta stories no mesmo CSV. Para stories, precisa de prints adicionais por enquanto.
