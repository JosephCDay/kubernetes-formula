# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import kubernetes as k8s with context %}
{%- set sls_binary_clean = tplroot ~ '.minikube.binary.clean' %}
{%- set sls_package_clean = tplroot ~ '.minikube.package.clean' %}
{%- set sls_source_clean = tplroot ~ '.minikube.source.clean' %}

include:
  - {{ sls_package_clean }}
  - {{ sls_source_clean }}
  - {{ sls_binary_clean }}

k8s-minikube-config-file-clean-file-absent:
  file.absent:
    - name: {{ k8s.minikube.config_file }}
    - require:
      - sls: {{ sls_package_clean }}
      - sls: {{ sls_source_clean }}
      - sls: {{ sls_binary_clean }}
