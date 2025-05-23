# Environnement de Développement avec Vagrant

Ce projet propose un environnement de développement reproductible à l'aide de [**Vagrant**](https://www.vagrantup.com/), avec provisionnement automatique de Docker, k3s etc...

---

## Objectifs

- Créer un environnement de développement local cohérent.
- Installer automatiquement Docker et ses dépendances.
- Installer Python3, Nginx et k3s pour l'ochestration des conteneurs.
- Permettre un workflow reproductible pour toute une équipe.

---

## Prérequis

- [Vagrant](https://www.vagrantup.com/) installé sur votre machine
- [VirtualBox](https://www.virtualbox.org/) version 7.1.4 ou supérieure
- Accès à Internet pour télécharger les images et les paquets

---

## Structure du projet

```
mon-projet-vagrant/
│
├── Vagrantfile
└── install-dependencies.sh
    README.md
```

- **Vagrantfile** : définit l’environnement virtuel (box, scripts de provisionnement, configuration Docker).
- **install-dependencies.sh** : script shell qui installe Docker, configure l’utilisateur `vagrant`, installe python, k3s , nginx etc...

---

## Installation

1. Clonez ce dépôt ou créez un dossier avec les deux fichiers ci-dessus.
2. Rendez le script exécutable :
   ```bash
   chmod +x install-dependencies.sh
   ```
3. Démarrez la machine virtuelle :
   ```bash
   vagrant up
   ```
   > Cela installe automatiquement Docker et toutes les bibliothèques souhaitées.

---

##  Connexion à la VM

```bash
vagrant ssh
```

Une fois connecté :
```bash
python3 --version
sudo k3s --version
sudo kubectl get nodes
sudo kubectl get all

```


---

## Provisionnement manuel

Si vous avez modifié le script de provisioning ou voulez relancer les actions :

```bash
vagrant provision
```
---

##  Commandes utiles

| Commande               | Description                                      |
|------------------------|--------------------------------------------------|
| `vagrant up`           | Démarre la VM                                    |
| `vagrant halt`         | Éteint la VM                                     |
| `vagrant suspend`      | Met la VM en pause                               |
| `vagrant resume`       | Reprend une VM suspendue                         |
| `vagrant destroy`      | Supprime complètement la VM                      |
| `vagrant ssh`          | Se connecte à la VM via SSH                      |
| `vagrant provision`    | Relance les scripts de configuration             |

---

##  Box utilisée

- **hashicorp-education/ubuntu-24-04**
- Version : `0.1.0`
- Provider : `VirtualBox`

---

## Ressources utiles

- Site officiel Vagrant : [https://www.vagrantup.com/](https://www.vagrantup.com/)
- Documentation complète : [https://developer.hashicorp.com/vagrant](https://developer.hashicorp.com/vagrant)
- Box registry : [https://app.vagrantup.com/boxes/search](https://app.vagrantup.com/boxes/search)

---

## Auteurs

Projet basé sur le tutoriel officiel **"Learn Vagrant: Get Started"** par HashiCorp.
