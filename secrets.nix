let
  francisco = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINo9UGHFmexiVJH+ufKw5tF8BoaVIfa1oSkMfBYwzcdC franciscoaguirreperez@gmail.com";
in
{
  "github-token.age".publicKeys = [francisco];
}
