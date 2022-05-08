# Tutorial Workflow pe GitHub


## 1. Alegem un issue la care vrem să lucrăm
Se poate vedea pe pagina principală a repository-ului tab-ul *Issues*

![Issues Highlight](/resources/img/IssuesHighlight.png)

Aici se pot vedea toate issue-uirle care sunt deschise momentan.

![Issues Page](/resources/img/IssuesPage.png)

După ce facem click pe un issue suntem redirectionati la pagina de discuții unde putem verifica daca nu se lucrează deja la acest issue.

![Issues Discussion page](/resources/img/IssueDiscussion.png)

Putem lăsa un comentariu indicând că vrem să rezolvăm noi acest issue.

![Issue Comment](/resources/img/IssueComment.png)

După ce ScrumMaster-ul ne da assign putem începe treaba.

![Issue Assign](/resources/img/IssueAssign.png)

## 2. Rezolvăm issue-ul

Pentru a putea lucra la proiect ne trebuie o copie a acestuia pe care să putem face modificări. În acest scop vom face un fork.

![Repo Fork](/resources/img/RepoFork.png)

Acum că avem propria copie a proiectului putem trage codul local pentru a putea începe treaba.

![](resources/img/RepoCode.png)

Vom da copy URL-ului pentru repository.

![](resources/img/RepoCopy.png)

Apoi vom deschide o linie de comandă și vom naviga către directorul în care vrem să avem copia proiectului. Aici vom apela :

```sh
git clone 
```

![](resources/img/GitClone.png)

Putem observa că în directorul respectiv apare un nou director ce corespunde repository-ului.

![](resources/img/GitFiles.png)

În punctul acesta putem începe treaba.

## 3. Commit upstream pe fork

După ce am terminat de rezolvat problema la care am fost asignați putem observa ce modificări am făcut asupra repositoriy-ului cu comanda:
```sh
git status
```

![](resources/img/GitStatus.png)

Trebuie să adaugăm fișierele dorite la următorul commit folosind comanda:
```sh
git add 
```
Dacă apelăm din nou `git status` vom observa că fișierele sunt acum marcate ca *staged*.

![](resources/img/GitAdd.png)

Acum putem să facem commit.

```sh
git commit
```

Observăm că ni se deschide un editor de text (în cazul meu VI) pentru a introduce mesajul de commit. Vom scrie un titlu și corp adecvate pentru commit menționând și issue-ul pe care îl abordam.

![](resources/img/GitCommitMessage.png)

Acum putem face push pe fork-ul nostru.
```sh
git push -u origin main
```

![](resources/img/GitPush.png)

##  4. Pull Request
Pentru ca schimbările noastre să apară și pe repository-ul original va trebui să facem un pull request.

Observăm că pe pagina de GitHub a fork-ului nostru apar aceste schimbări, împreună cu o notificare. Aceasta are un shortcut spre a creea un pull-request.

![](resources/img/GithubPR.png)

Aici putem verica încă o data schimbările pe care dorim să la trimitem către repository-ul principal și mesajul commit-ului.

![](resources/img/GithubSubmmitPR.png)

![](resources/img/GithubSubmmitPRmessage.png)

Acum tot ce trebuie să facem este să așteptam că o persoana cu acces la repository-ul principal să facă merge.

![](resources/img/GithubMergerd.png)

