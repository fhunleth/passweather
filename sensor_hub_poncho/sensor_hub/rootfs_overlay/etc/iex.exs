#---
# Excerpted from "Build a Weather Station with Elixir and Nerves",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/passweather for more book information.
#---
IO.puts("""
\e[34m████▄▖    \e[36m▐███
\e[34m█▌  ▀▜█▙▄▖  \e[36m▐█
\e[34m█▌ \e[36m▐█▄▖\e[34m▝▀█▌ \e[36m▐█   \e[39mN  E  R  V  E  S
\e[34m█▌   \e[36m▝▀█▙▄▖ ▐█
\e[34m███▌    \e[36m▀▜████\e[0m
""")

# Add Toolshed helpers to the IEx session
use Toolshed

if RingLogger in Application.get_env(:logger, :backends, []) do
  IO.puts("""
  RingLogger is collecting log messages from Elixir and Linux. To see the
  messages, either attach the current IEx session to the logger:

    RingLogger.attach

  or print the next messages in the log:

    RingLogger.next
  """)
end
