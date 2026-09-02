**Setting up Development Environment**
========================================== 

Below are some useful resources for learning more about forking and pull requests on GitHub:

* the `GitHub documentation for forking a repo <https://docs.github.com/en/get-started/quickstart/fork-a-repo>`_.
* the `GitHub documentation for collaborating with pull requests <https://docs.github.com/en/pull-requests/collaborating-with-pull-requests>`_.
* the `GitHub documentation for working with forks <https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks>`_.

Getting started with Git
------------------------

`GitHub has instructions <https://docs.github.com/en/get-started/quickstart/set-up-git>`__ for installing git,
setting up your SSH key, and configuring git.  All these steps need to be completed before
you can work seamlessly between your local repository and GitHub.

.. _contributing.forking:

Create a fork of pandas
-----------------------

You will need your own copy of Meradeb (aka fork) to work on the code. Go to the `Meradeb
page <https://github.com/prithvijitguha/meradeb>`_ and hit the ``Fork`` button. Please uncheck the box to copy only the main branch before selecting ``Create Fork``.
You will want to clone your fork to your machine

.. code-block:: shell

    git clone https://github.com/your-user-name/meradeb.git meradeb-yourname
    cd meradeb-yourname
    git remote add upstream https://github.com/prithvijitguha/meradeb.git
    git fetch upstream --tags

This creates the directory ``meradeb-yourname`` and connects your repository to
the upstream (main project) *pandas* repository.

Creating a feature branch
-------------------------

Your local ``main`` branch should always reflect the current state of pandas repository.
First ensure it's up-to-date with the main pandas repository.

.. code-block:: shell

    git checkout main
    git pull upstream main --ff-only

Then, create a feature branch for making your changes. For example

.. code-block:: shell

    git checkout -b shiny-new-feature

This changes your working branch from ``main`` to the ``shiny-new-feature`` branch.  Keep any
changes in this branch specific to one bug or feature so it is clear
what the branch brings to pandas. You can have many feature branches
and switch in between them using the ``git checkout`` command.


Make your changes locally 
------------------------------- 

Once you've made your changes locally you can push your changes to the remote development branch 

.. code-block:: shell

    git add your-modified-or-newly-created-file
    git commit -m "Made a new shiny new feature"
    git push --upstream origin shiny-new-feature


Setting up environment variables
----------------------------------- 

Enter a variable called MERADEB_REF. This is used in the installation script so that we use the reference branch instead of the original 
main default branch

.. code-block:: shell 
   
   export MERADEB_REF=$(git branch --show-current)


After that its the regular installation process, install whichever components you are testing
