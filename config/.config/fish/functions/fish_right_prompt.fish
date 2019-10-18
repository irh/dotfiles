function fish_right_prompt
  # Host
  set_color bryellow
  set -l host_name (hostname -s)
  echo -n "$host_name "
  # Time
  set_color blue
  echo -n (date +%H:%M:%S)
end
