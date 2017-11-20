#!/bin/bash
killall -9 beam.smp
clear
iex -S mix phx.server
