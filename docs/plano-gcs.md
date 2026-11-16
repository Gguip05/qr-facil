# Plano de Gerenciamento de Configuração — QR Fácil

**Enfoque DevOps — Integração e Entrega Contínuas (CI/CD)** · Versão 1.2

> Este plano é um item de configuração do projeto: é versionado neste repositório e só muda por Pull Request revisado (seção 5.2).

| Campo | Descrição |
| --- | --- |
| Projeto | QR Fácil — gerador de QR Code |
| Gerente de Projeto | Guilherme Peiter ([@Gguip05](https://github.com/Gguip05)) |
| Gerente/Responsável de GCS-DevOps | Guilherme Peiter |
| Fábrica de Software / Squad | Desenvolvimento individual, com par de revisão |
| Par de revisão | [@felipekockmendonca](https://github.com/felipekockmendonca) (colaborador com acesso de escrita) |
| Repositório principal | https://github.com/Gguip05/qr-facil |

## Histórico de Revisões

| Data | Versão | Descrição | Autor |
| --- | --- | --- | --- |
| 21/09/2026 | 1.0 | Elaboração do PGC para o QR Fácil com base no pacote-fonte e no relatório N1-E5. | Guilherme Peiter |
| 21/09/2026 | 1.1 | Atualização do PGC após publicação do repositório GitHub e configuração de CI. | Guilherme Peiter |
| 16/11/2026 | 1.2 | Publicação do PGC no repositório como item de configuração; par de revisão, proteção da `main` e Environments `staging` e `production` (N2-P2). | Guilherme Peiter |

## 1. Introdução
Este Plano de Gerenciamento de Configuração (PGC) descreve como a configuração do aplicativo QR Fácil será identificada, versionada, revisada e rastreada. O projeto é uma aplicação Flutter que gera QR Codes a partir de texto ou links digitados pelo usuário e utiliza a biblioteca qr_flutter do pub.dev.

### 1.1 Finalidade
Estabelecer o processo individual de gestão de configuração do QR Fácil, preservando a rastreabilidade entre código, dependências, testes e versões distribuídas. O plano prioriza Git, revisão de mudanças e automação de verificações compatíveis com um projeto Flutter.

### 1.2 Escopo
*Este PGC abrange o desenvolvimento individual do QR Fácil por Guilherme Peiter. Inclui o aplicativo Flutter, o código Dart, a configuração Android/Web, os testes, a documentação e os arquivos de dependência. O repositório público do projeto é https://github.com/Gguip05/qr-facil.*

### 1.3 Definições, Acrônimos e Abreviações
| Termo | Significado |
| --- | --- |
| GCS | Gestão de Configuração de Software |
| CI | Integração Contínua (Continuous Integration) |
| CD | Entrega/Implantação Contínua (Continuous Delivery / Deployment) |
| IaC | Infraestrutura como Código (Infrastructure as Code) |
| CCM | Comitê de Controle de Mudanças |
| Baseline | Conjunto de itens de configuração que atingiram um estado comprovado de estabilidade |
| Pipeline | Sequência automatizada de etapas de build, teste, análise e implantação |
| Trunk-based Development | Estratégia de branching em que os desenvolvedores integram na branch principal com alta frequência |
| SemVer | Versionamento Semântico (MAJOR.MINOR.PATCH) - 1.0.0. |
| DORA Metrics | Métricas de desempenho DevOps (Lead Time, Deployment Frequency, MTTR, Change Failure Rate) |

### 1.4 Referências
- Documento base: Processos de Desenvolvimento de Software e a Integração com GCS.

- Template do Plano de Gerenciamento de Configuração (RUP 7.0, IBM) — adaptado.

*Referências do projeto: relatório N1-E5 - Aplicativo com biblioteca do pub.dev; pacote-fonte GuilhermePeiter_N1-E5.zip; repositório https://github.com/Gguip05/qr-facil; pubspec.yaml e pubspec.lock; documentação da biblioteca qr_flutter no pub.dev.*

### 1.5 Visão Geral
A configuração é mantida em Git e publicada no repositório GitHub do projeto. Cada alteração relevante deve ser rastreada por commit, validada por análise estática e testes Flutter e, quando publicada, identificada por versão e tag. O projeto possui workflow de CI no GitHub Actions para executar flutter analyze e flutter test em pushes para main e Pull Requests.

## 2. Cultura DevOps e Papéis na Gerência de Configuração
Como o projeto é individual, Guilherme Peiter acumula as responsabilidades de desenvolvimento, revisão de configuração, testes e liberação. Quando houver colaboração, uma segunda pessoa deverá revisar os Pull Requests antes do merge.

| Papel | Responsabilidades |
| --- | --- |
| Responsável pelo projeto e GCS-DevOps | Guilherme Peiter: mantém a configuração do projeto, aprova mudanças e registra versões liberadas. |
| Desenvolvedor(a) | Guilherme Peiter: implementa funcionalidades, atualiza dependências e mantém o código Flutter. |
| QA / testes | Guilherme Peiter: executa flutter analyze, flutter test e teste funcional do QR Fácil antes da liberação. |
| Par de revisão | @felipekockmendonca: colaborador com acesso de escrita; revisa e aprova os Pull Requests antes do merge na `main`. |

## 3. Ferramentas, Ambientes e Infraestrutura
### 3.1 Ferramentas do Pipeline
Ferramentas efetivamente adotadas no QR Fácil:

| Categoria | Ferramenta(s) sugerida(s) | Finalidade |
| --- | --- | --- |
| Linguagem e framework | Dart / Flutter | Desenvolvimento e build do aplicativo. |
| Controle de versão | Git + GitHub | Rastrear código, configuração, commits e releases. |
| Dependências | pub.dev + pubspec.yaml / pubspec.lock | Declarar e reproduzir versões, inclusive qr_flutter 4.1.0. |
| Análise estática | flutter analyze / flutter_lints | Detectar problemas e aplicar padrões Dart. |
| Testes | flutter test | Executar teste automatizado e validações futuras. |
| Build | flutter build | Gerar artefatos Android ou Web. |
| CI | GitHub Actions | Executar flutter pub get, flutter analyze e flutter test em main e Pull Requests. |
| Rastreamento | GitHub Issues e Pull Requests | Vincular mudanças a tarefas e revisões quando aplicável. |

### 3.2 Ambientes e Infraestrutura
O projeto possui configuração para Android e Web. O desenvolvimento usa Flutter/Dart e as dependências declaradas no pubspec.yaml. A validação contínua é executada no GitHub Actions. Não há infraestrutura em nuvem, banco de dados ou definições de IaC no escopo atual.

| Ambiente | Finalidade | Gatilho de promoção |
| --- | --- | --- |
| Desenvolvimento | Execução local com Flutter e dependências restauradas. | Alteração local em branch de trabalho. |
| Validação | Emulador/dispositivo Android ou navegador para testes funcionais. | flutter analyze e flutter test concluídos. |
| Distribuição | Artefato Android ou Web quando o canal de publicação for definido. | Build de release validado e versão aprovada. |

*Desenvolvimento: execução local com Flutter. Validação contínua: GitHub Actions executa análise e testes. Homologação: execução em emulador/dispositivo Android ou navegador. Produção: distribuição futura do aplicativo gerado. O projeto não requer segredos próprios.*

Environments configurados no GitHub (Settings → Environments):

| Environment | Regra |
| --- | --- |
| `staging` | Implantação apenas a partir de branches protegidas. |
| `production` | Implantação apenas a partir de branches protegidas, com aprovação obrigatória de @Gguip05 (revisor obrigatório). |

### 3.3 Estratégia de Branching e Versionamento
O projeto utiliza GitHub Flow. A branch main contém a versão estável; branches feature/<descricao-curta> devem ser usadas para mudanças futuras, com Pull Request antes da integração. O repositório público é https://github.com/Gguip05/qr-facil.

- main: contém a versão estável e liberável do QR Fácil. É protegida: não aceita push direto, exige Pull Request com 1 aprovação do par de revisão, histórico linear e não permite exceções (nem para o administrador). O merge é feito somente por squash.

- feature/<descricao-curta>: branch de curta duração para uma funcionalidade ou correção.

- release/x.y: opcional, usada apenas para estabilização antes de uma distribuição.

- hotfix/<descricao>: correção urgente aplicada a partir da última versão estável e posteriormente integrada à main.

Versionamento: SemVer. A versão atual declarada em pubspec.yaml é 1.0.0+1; futuras tags de release devem usar o formato vX.Y.Z. Os commits já utilizam mensagens descritivas com prefixos feat, test, ci e chore.

## 4. Identificação da Configuração
### 4.1 Itens de Configuração
Os itens de configuração do QR Fácil são versionados no mesmo repositório quando este for inicializado:

- Código-fonte Dart: lib/main.dart e testes em test/.

- Automação de CI: .github/workflows/flutter-ci.yml, que restaura dependências, executa flutter analyze e flutter test.

- Configurações de plataforma: android/ e web/.

- Arquivos de controle do projeto: .gitignore, .metadata e README.md.

- Bibliotecas de terceiros: qr_flutter 4.1.0, cupertino_icons 1.0.8, flutter_lints 6.0.0 e dependências transitivas travadas em pubspec.lock.

- Artefatos de build: APK/AAB ou pacote Web, quando gerados para distribuição; não devem ser versionados no código-fonte.

- Documentação: relatório N1-E5, README.md e este plano (docs/plano-gcs.md).

- Modelos de colaboração: .github/CODEOWNERS, .github/pull_request_template.md e .github/ISSUE_TEMPLATE/.

- Normalização de arquivos: .gitattributes.

### 4.2 Convenção de Nomenclatura
| Item | Convenção | Exemplo |
| --- | --- | --- |
| Branch de feature | feature/<descricao-curta> | feature/gerar-qr |
| Commit | Conventional Commits: <tipo>: <descricao> | feat: melhora geracao de QR |
| Tag de release | Versionamento Semântico vX.Y.Z | v1.0.0 |
| Versão do app | X.Y.Z+build no pubspec.yaml | 1.0.0+1 |
| Pacote fonte | <nome-do-projeto>.zip | GuilhermePeiter_N1-E5.zip |

### 4.3 Estrutura do Repositório
*Estrutura principal: /lib para o código Dart, /test para testes, /.github/workflows para automação, /android e /web para plataformas, pubspec.yaml para manifesto, pubspec.lock para versões resolvidas e README.md para documentação. As configurações Android/Web devem permanecer sincronizadas com o repositório.*

## 5. Integração Contínua (CI)
Todo push para main e todo Pull Request disparam o workflow Flutter CI no GitHub Actions. O pipeline executa flutter pub get, flutter analyze e flutter test. Nenhuma mudança futura deve ser considerada pronta sem essas verificações.

### 5.1 Etapas do Pipeline de CI
1. Checkout do código e restauração das dependências com flutter pub get no GitHub Actions.

2. Análise estática com flutter analyze.

3. Execução dos testes com flutter test.

4. Build de validação local para a plataforma-alvo, por exemplo flutter build apk ou flutter build web.

5. Verificação de dependências por meio de pubspec.lock e atualização controlada das versões.

6. Publicação do artefato de distribuição somente após as verificações anteriores concluírem com sucesso.

7. Registro da versão liberada por tag Git e anexação do artefato de build à release do GitHub.

### 5.2 Política de Pull Request e Revisão de Código
- Para o trabalho individual, Guilherme Peiter revisa o diff e acompanha o resultado do GitHub Actions antes da integração. Em colaboração, cada Pull Request deve exigir ao menos uma aprovação de outra pessoa.

- PRs devem conter uma alteração lógica e descrever a finalidade, testes realizados e impacto em dependências ou plataformas.

- Para mudanças futuras, o merge deve ocorrer após flutter analyze e flutter test sem erros; builds de release devem ser validados para a plataforma distribuída.

### 5.3 Critérios de Qualidade (Quality Gate)
*Quality gate: zero erros bloqueantes em flutter analyze; todos os testes de flutter test aprovados; dependências reproduzíveis por pubspec.lock; build da plataforma-alvo concluído. Não há cobertura mínima medida configurada no pacote entregue.*

## 6. Entrega e Implantação Contínua (CD)
O CI está configurado no GitHub Actions. O projeto ainda não possui pipeline de CD nem ambiente remoto; as entregas são builds gerados para Android ou Web. Quando houver automação de CD, o mesmo artefato validado em CI deverá ser promovido sem recompilação.

### 6.1 Etapas do Pipeline de CD
1. Gerar o artefato de release após o quality gate: flutter build apk/aab ou flutter build web, conforme a plataforma.

2. Instalar ou abrir o build em dispositivo/emulador Android ou navegador e executar teste funcional de geração de QR Code.

3. Registrar a aprovação da versão pelo responsável do projeto antes de distribuição externa.

4. Publicar o artefato no canal de distribuição escolhido quando esse canal estiver definido.

5. Executar smoke test: abrir o aplicativo, informar texto ou URL e confirmar que o QR Code é exibido.

6. Criar a tag Git vX.Y.Z e registrar notas de versão baseadas nas mudanças liberadas.

### 6.2 Estratégias de Implantação
| Estratégia | Descrição |
| --- | --- |
| Build validado | Gerar APK/AAB ou Web após análise e testes. |
| Teste funcional | Abrir o app e gerar QR Code a partir de texto ou URL. |
| Release identificada | Registrar versão e tag Git quando o repositório existir. |
| Rollback | Redistribuir a última versão validada se a nova falhar. |

### 6.3 Rollback e Recuperação
Toda liberação deve manter o artefato e a tag da versão anterior. Em caso de falha, a recuperação consiste em redistribuir o último build validado e registrar a causa da reversão. Não há deploy automatizado no pacote atual.

## 7. Infraestrutura como Código (IaC)
Não se aplica nesta versão: o QR Fácil não possui infraestrutura provisionada, serviços remotos, banco de dados ou IaC no material entregue. Caso esses elementos sejam adicionados, deverão ser versionados e revisados pelo mesmo fluxo de mudança.

### 7.1 Versionamento de Infraestrutura
- Se infraestrutura for introduzida, seus arquivos deverão seguir Pull Request, revisão e validação antes de aplicação. Não há state file nem provedor de infraestrutura no escopo atual.

- Não aplicável ao escopo atual.

### 7.2 Ambientes Efêmeros
Não aplicável ao escopo atual; ambientes de revisão poderão ser avaliados caso seja criado um pipeline Web.

## 8. Controle de Configuração e Mudança
### 8.1 Processo de Solicitação de Mudança
Mudanças futuras seguirão o fluxo: registrar a tarefa ou objetivo, criar branch feature, alterar o código ou configuração, abrir Pull Request, acompanhar o GitHub Actions, revisar o diff, integrar em main e registrar a versão liberada. Os commits e o histórico do GitHub são as evidências rastreáveis da mudança.

### 8.2 Comitê de Controle de Mudança (CCM)
Não há CCM formal para este projeto individual. Mudanças de alto impacto, como alteração de dependência principal, plataforma ou publicação externa, exigem revisão explícita do responsável antes da liberação.

*Responsável pelo controle de mudança: Guilherme Peiter. Critérios de revisão reforçada: atualização de qr_flutter ou Flutter SDK, alteração em permissões Android, mudança na estrutura de plataformas ou distribuição de nova release.*

## 9. Baselines e Releases
### 9.1 Geração Automática de Baseline
A baseline inicial é a versão 1.0.0+1 declarada em pubspec.yaml e publicada no repositório GitHub. A próxima release deve associar tag Git, commit, pubspec.lock e artefato de build correspondente.

### 9.2 Notas de Versão (Release Notes)
As notas de versão devem listar funcionalidades, correções, alterações de dependência e instruções de validação. Elas podem ser mantidas na página de Releases do GitHub a partir da primeira tag.

## 10. Estimativa do Status de Configuração
### 10.1 Monitoramento e Observabilidade
O aplicativo não possui serviço remoto para monitoramento operacional. A verificação atual é funcional: abertura da tela, limite de 120 caracteres, contador e geração de QR Code a partir de texto ou URL.

### 10.2 Métricas DORA
| Métrica | Descrição |
| --- | --- |
| Análise estática | Quantidade de erros bloqueantes em flutter analyze; meta: zero. |
| Testes | Resultado de flutter test; meta: todos aprovados. |
| Build | Conclusão do build da plataforma-alvo; meta: sucesso. |
| Dependências | Diferenças em pubspec.lock revisadas antes do merge. |

### 10.3 Relatórios e Auditorias
A auditoria é baseada no histórico do GitHub, nos commits, no workflow de CI, em pubspec.lock e nos registros de flutter analyze, flutter test e builds. O relatório N1-E5 e o ZIP permanecem como evidências da baseline inicial.

## 11. Marcos
*Marco 1: baseline inicial 1.0.0+1 entregue. Marco 2: repositório GitHub publicado. Marco 3: automação de flutter analyze e flutter test implantada. Marco 4: primeira tag e release publicada.*

## 12. Treinamento e Recursos
*Recursos: Flutter SDK compatível com Dart 3.13.3, editor com suporte a Dart/Flutter, Git, GitHub e dispositivo/emulador Android ou navegador. Treinamento necessário: fluxo Git/GitHub, Pull Requests, execução de flutter analyze/test/build e atualização segura de dependências do pub.dev.*

## 13. Controle de Software de Subcontratados, Fornecedores e Dependências de Terceiros
A biblioteca qr_flutter e as demais dependências Flutter são itens de configuração de terceiros. As versões declaradas em pubspec.yaml e resolvidas em pubspec.lock devem ser preservadas para permitir builds reproduzíveis.

- Atualizações de dependências devem ser avaliadas com flutter pub outdated, registradas em branch própria, submetidas a Pull Request e validadas pelo GitHub Actions antes do merge.

- Não há subcontratados ou fornecedores de software no escopo informado. Serviços ou componentes futuros deverão passar pelo mesmo fluxo de revisão, CI e rastreabilidade no GitHub.

*Não aplicável ao pacote atual.*

## 14. Quadro-Resumo do Pipeline CI/CD
Resumo do fluxo adotado no QR Fácil, da alteração ao registro da entrega:

| Etapa | Descrição | Gatilho |
| --- | --- | --- |
| Alteração | Modificar código ou configuração em branch de trabalho. | Tarefa, melhoria ou correção identificada |
| CI | GitHub Actions restaura dependências, analisa o código e executa testes. | Push em main ou Pull Request |
| Revisão | Revisar o diff e o resultado do workflow antes da integração. | CI concluído |
| Build | Gerar artefato Android ou Web para validação local. | Mudança aprovada |
| Release | Criar tag e notas de versão quando houver distribuição. | Build funcional aprovado |

*Este plano está alinhado ao QR Fácil e ao repositório GitHub. A automação atual valida análise estática e testes, a `main` está protegida e os Environments `staging` e `production` estão criados; pipeline de CD e tags de release são evoluções previstas para as próximas entregas.*
