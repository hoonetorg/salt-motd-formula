# vim: sts=2 ts=2 sw=2 et ai
{% from "motd/map.jinja" import motd with context %}

motd__file_{{motd.filename}}:
  file.managed:
    - name: {{motd.filename}}
    - source: salt://motd/files/motd
    - template: jinja
    - user: root
    - group: root
    - file_mode: '0644'
    - context:
        motd: {{motd|yaml}}
    - watch_in:
      - service: motd__service_chronyd

motd__service_chronyd:
  service.running:
    - name: chronyd
