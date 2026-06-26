# Custom functions

gcm() {
  local t=$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null)
  t="${t#origin/}" && [[ -n "$t" ]] || t="main"
  git checkout "$t"
}
