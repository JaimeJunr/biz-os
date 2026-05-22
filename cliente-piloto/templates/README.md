# templates/

Biblioteca local copiada para cada cliente novo. Usada pelo `/instalar` e por outros slash commands quando precisam de um boilerplate.

- `perfis/` — 4 variações de `CLAUDE.md` (solopreneur, freelancer, agencia, empresa). O `/instalar` escolhe uma e copia pra raiz substituindo `{{NOME_DO_CLIENTE}}`.
- `identidade/` — boilerplate de `design-guide.md` (paleta, tipografia, grid).
- `ferramentas/` — boilerplates de planilhas, scripts, automações (vazio por padrão; adicione conforme padroniza).
- `skills/` — skills custom específicas deste cliente (vazio por padrão).

**Importante:** o conteúdo desta pasta sobrevive ao `/instalar`. É a "biblioteca viva" que cresce com o uso.
