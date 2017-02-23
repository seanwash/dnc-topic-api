# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Dnctopicapi.Repo.insert!(%Dnctopicapi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Dnctopicapi.{Repo, Episode}

Repo.insert(%Episode{
  guid: "sdfadfalj3l121",
  title: "Episode 1",
  description: "Maecenas sed diam eget risus varius blandit sit amet non magna.",
  long_description: "Etiam porta sem malesuada magna mollis euismod. Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.",
  audio_url: "http://google.com",
  sharing_url: "http://google.com",
  duration: 1235
})

Repo.insert(%Episode{
  guid: "sdfadfalj3lsd",
  title: "Episode 2",
  description: "Maecenas sed diam eget risus varius blandit sit amet non magna.",
  long_description: "Etiam porta sem malesuada magna mollis euismod. Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.",
  audio_url: "http://google.com",
  sharing_url: "http://google.com",
  duration: 1235
})
