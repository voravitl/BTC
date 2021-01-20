#!/bin/bash
COIN="ALGO"
rm -f *.txt
function ta_macd_ext {
for i in {20..40}
#for i in SMA EMA WMA DEMA TEMA TRIMA KAMA MAMA T3
#for i in 10 20 30 40 50 60 70 80 90 100
#for i in 1m 2m 3m 5m 15m 30m 45m 1h 4h  
do
zenbot sim binance.${COIN}-BTC  \
--strategy=multi \
--period_length=3m \
--order_adjust_time=13000 \
--order_poll_time=13000 \
--poll_trades=13000 \
--min_periods=52 \
--overbought_rsi_periods=25 \
--overbought_rsi=74 \
--length=20 \
--fish_pct_change=0 \
--pos_length=2 \
--src=ohlc4 \
--momentum_size=2 \
--max_sell_loss_pct=25 \
--profit_stop_enable_pct=9 \
--profit_stop_pct=2 \
--exact_buy_orders \
--exact_sell_orders \
--max_slippage_pct=4 \
--markdown_buy_pct=0.25 \
--markup_sell_pct=0.26 \
--sell_pct=100 --buy_pct=100 --currency_capital=0.08 --days=5  | grep -A5 "end balance" > $i.txt
done
}
zenbot backfill binance.${COIN}-BTC
ta_macd_ext
#24 54
# --end=201903080900
