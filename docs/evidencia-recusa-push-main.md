# Evidência: recusa do push direto na `main`

Registro do teste previsto na Aula 1 (passo 6) e no PGC, seções 3.3 e 5.2.

| Campo | Valor |
| --- | --- |
| Data | 16/11/2026, 19:20 (horário de Brasília) |
| Usuário | @Gguip05 (administrador do repositório) |
| Ação tentada | Commit direto na `main` pelo editor do GitHub (*Commit changes*), alterando o `README.md` |
| Resultado | Recusado |

## Mensagem exibida pelo GitHub

> You can’t commit to `main` because it is a protected branch

A opção "Commit directly to the main branch" deixou de ser oferecida; a única alternativa apresentada foi "Create a new branch for this commit and start a pull request". Nenhum commit foi criado na `main` por essa tentativa.

## Regra que causou a recusa

Settings → Branches → regra de proteção para `main`:

- Require a pull request before merging, com 1 aprovação obrigatória
- Dismiss stale pull request approvals when new commits are pushed
- Require linear history
- Do not allow bypassing the above settings (vale também para o administrador)

## Fluxo aceito

A mesma proteção foi exercitada no sentido oposto pelo [Pull Request #1](https://github.com/Gguip05/qr-facil/pull/1): branch `feature/ci-analyze-no-fatal-infos`, aprovação do par de revisão @felipekockmendonca e merge por squash.
