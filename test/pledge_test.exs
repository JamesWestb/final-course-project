defmodule PledgeTest do
  use ExUnit.Case

  test "sends a GET to the server; server responds with 3 most recent pledges and their total amounts" do
    Servy.PledgeServer.start()

    Servy.PledgeServer.create_pledge("gary", 45)
    Servy.PledgeServer.create_pledge("terry", 40)
    Servy.PledgeServer.create_pledge("lary", 60)
    Servy.PledgeServer.create_pledge("harry", 10)
    Servy.PledgeServer.create_pledge("barry", 50)

    response = Servy.PledgeServer.recent_pledges()
    total = Servy.PledgeServer.total_pledged()

    assert response == [{"barry", 50}, {"harry", 10}, {"lary", 60}]
    assert total == 120
  end
end
