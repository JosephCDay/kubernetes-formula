# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import kubernetes as k8s with context %}

include:
  {{ '- .package' if k8s.minikube.pkg.use_upstream_repo else '' }}
  {{ '- .source' if k8s.minikube.pkg.use_upstream_source else '' }}
  {{ '- .binary' if k8s.minikube.pkg.use_upstream_binary else '' }}
  - .config
