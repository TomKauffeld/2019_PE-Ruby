---
layout: post
title: "TP7, Codex !"
categories: ruby-2a
source : [github](https://github.com/kbogtob/iut-ruby-tp7)
author : [kbogtob](https://github.com/kbogtob)
---

# Codex

Dans ce TP, on va partir d'un code existant que vous trouverez [sur github](https://github.com/kbogtob/iut-ruby-tp7)
Attention, la version de référence du sujet est celle sur hina (que vous lisez
en ce moment).

Le but du TP est d'écrire une application qui permet de tenir un journal de ses aventures de développeur.

> Un codex est un cahier formé de pages manuscrites reliées ensemble. Cet ancêtre du livre moderne a été inventé à Rome durant le iie siècle av. J.-C. et s'est répandu à partir du ier siècle, pour progressivement remplacer le rouleau de papyrus (le volumen) grâce à son faible encombrement, son faible coût, sa maniabilité et la possibilité qu'il offre d'accéder directement à n'importe quelle partie du texte. - [Wikipedia](https://fr.wikipedia.org/wiki/Codex)

Ce TP peut être réalisé indifféremment avec un des outils de test suivants: Rspec ou [Minitest](http://docs.seattlerb.org/minitest/).

## Pré-requis

Pour ce projet, on aura besoin de l'application bundle, qui est fournie avec la gem bundler. Vous devriez donc commencer par installer la gem bundler en local.

### Installer des gems

* [Introduction](https://www.ruby-lang.org/en/libraries/)
* [Doc officielle de référence](http://guides.rubygems.org/command-reference/)
* Bien faire une installation locale (dans votre compte), regarder l'option `--user-install` sinon vous n'aurez pas les droits
* Aide: Il vous faut apprendre à votre système comment accéder à l'extérieur
(dans le cadre de l'IUT, un proxy web).

```sh
export HTTPS_PROXY=193.49.118.36:8080
export HTTP_PROXY=193.49.118.36:8080
```

* Installation *system wide*:

```sh
gem install ma_gem
```

* Vous trouverez une bonne description de beaucoup d'outils Ruby (dont des
gemmes) sur [Ruby Toolbox](https://www.ruby-toolbox.com/).

### Bundler

[**La documentation de bundler**](http://bundler.io/v1.12/#getting-started)

## Consulter le code existant

* Un codex sauvegardé ressemble à ça : [Codex](https://github.com/kbogtob/iut-ruby-tp7/blob/master/spec/etc/sample_journal.codex)

* Essayez de comprendre comment les classes existantes fonctionnent :
  * Entry : Classe qui modélise une entrée dans le journal
  * Loader : Classe qui charge des entries depuis un format de fichier spécifique
  * Serializer : Classe qui sérialise des entries vers un format de fichier spécifique (sérialiser : transformer des objets en un format qui puisse être enregistré ou envoyé)

### Rspec (pour Minitest, voir section suivante)

* Essayez la commande suivante :

```sh
rspec
```

Que se passe-t-il ? Pourquoi ?

Comment résoudre le problème ?

* Exceptionnellement, j'ai ajouté dans le dépôt un fichier .rspec pour avoir des options rspec par défaut. Prenez connaissance de son contenu.

### Minitest (pour RSpec, voir section précédente)

* Essayez la commande suivante:

```sh
rake
```

* `rake` est une sorte de _make_ pour Ruby. Le fichier de configuration est le _Rakefile_
* Votre rake a du planter. Il manque la gem _minitest-reporters_. Installez la avec bundler et recommencez.

### Comment sont faits les tests?

* Lisez les commentaires et les specs (répertoire _spec_ pour *rspec* ou _minitest/spec_ pour *minitest*)

## Tâches préliminaires

### Vérification

* Pour être sûr que vous avez bien compris, comment pourrait-on casser le fonctionnement de la classe Loader sans casser les tests unitaires ? (indice: Tout est une histoire de cardinalité).

* Remettez le code comme il était

```sh
# SI BESOIN
git checkout .
```

### Petite amélioration

* Ecrivez les specs pour que la classe Entry recoive un paramètre _date_ au format string (ou DateTime, bien entendu) et qu'elle le convertisse bien en DateTime. (indice: Consulter la documentation de DateTime ou les specs du Loader)

* Vérifiez que les specs ne passent pas.

* Ecrivez l'implémentation de la classe Entry pour que les specs passent.

* Vérifiez que les specs passent.

Félicitations, vous avez développé votre première fonctionnalité en TDD !

>It has long been asserted that Test Driven Development (TDD) is the equivalent of double-entry bookkeeping. There are some undeniable parallels. Under the discipline of TDD every desired behavior is written twice; once in test code that verifies the behavior, and once in production code that exhibits that behavior. The two streams of code are written concurrently, and follow complimentary, yet separate execution pathways until they converge in the count of defects - a count that must be zero. - [Oncle Bob](http://blog.cleancoder.com/uncle-bob/2017/03/07/SymmetryBreaking.html)

Traduction : Il est depuis longtemps assumé que le TDD est l'équivalent de la technique de la comptabilité en partie double (quand on crédite un compte, on en débite un autre ; un + d'un côté, un - de l'autre). Il y a des parallèles indéniables. Dans la discipline du TDD, chaque comportement voulu est décrit deux fois; une fois dans le code de test qui vérifie le comportement, et une fois dans le code de production qui détermine ce comportement. Ces deux flux de code sont écrits de façon concurrente, et suivent de façon complémentaire et séparée différents chemins d'exécution jusqu'à ce qu'ils convergent vers un nombre de défauts (ou échecs) ;  nombre qui doit tendre vers zéro. (c'est beau et philosophique)

## Au boulot !

### Implémentez une classe _Journal_ en TDD.

Indications :
* A : Écrivez une classe vide
* B : Ajoutez les specs d'une méthode
* C : Écrivez la
* D : Une fois tout au vert, goto B

Méthodes :
* `#initialize(entries)`: Constructeur prenant en paramètre des entries
* `#entries`: getter sur les entries
* `.load(path)`: Méthode de classe qui fait appel à la classe Loader pour charger des entries depuis un fichier et initialiser un journal. Le premier bougre qui lit réellement le fichier ici aura le droit aux orties ! On mock (avec [Rspec](http://rspec.info/documentation/3.4/rspec-mocks/) ou avec [Minitest](http://docs.seattlerb.org/minitest/#label-Mocks), ou dans [cet article](http://www.monkeyandcrow.com/blog/ruby_standard_library_minitest_mock/) ) !
* `#count`: Renvoie le nombre d'entries dans le journal
* `#add_entry(entry)`: Ajouter une entry dans le journal (pour l'id, on prendra le max de l'id des entries +1)

### Implémentez un CLI avec Thor!
[THOOOOR](http://i.imgur.com/YmGKkqs.gif)

* Lisez rapidement la documentation de [Thor](http://whatisthor.com/)
* Ajoutez la gem 'thor' au projet (via le Gemfile)
* Ecrivez un client thor et testez manuellement votre programme. On doit pouvoir réaliser les opérations suivantes :

```sh
# lister les entrées du codex
bundle exec ruby bin/app list
# ajouter une nouvelle entrée au codex
bundle exec ruby bin/app add "J'ai bien avancé dans mon TP en TDD, j'ai atteint l'illumination."
# compter les entrées du codex
bundle exec ruby bin/app count
# supprimer une entrée du codex (facultatif)
bundle exec ruby bin/app remove 42
```

* Sauvegardez votre codex dans ~/journal.codex

## Bonus questions for those delicious bonus points

* Ajoutez une méthode `#remove_entry(entry_id)` qui supprime une entry via son champ id & l'option du client thor qui va avec
* Ajouter une option `--file` pour fournir un fichier codex à l'application et ne pas utiliser celui par défaut

## Super plus

* Écrivez les tests unitaires de la classe Serializer !

## Encore plus:  Coder un exploit pour Metasploit

* [Metasploit](https://www.metasploit.com/) est un outil populaire de pentesting
(audit de sécurité). Ses exploits (les modules
 qui détectent une faille donnée) sont écrits en Ruby.
 * Vous pouvez écrire vos [propres
 exploits](https://github.com/rapid7/metasploit-framework/wiki/Setting-Up-a-Metasploit-Develop
 ment-Environment).
 * A noter: je n'ai bien sûr pas installé de metasploit sur les machines
 pédagogiques.

