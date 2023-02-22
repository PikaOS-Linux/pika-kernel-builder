#!/bin/bash

echo "Pika Kernel - Applying configuration"

cp ../config .config

scripts/config -k -e CONFIG_GENERIC_CPU
scripts/config -e CACHY
scripts/config -e SCHED_BORE

scripts/config -e HZ_300 --set-val HZ 1000
scripts/config -d HZ_PERIODIC -d NO_HZ_FULL -e NO_HZ_IDLE  -e NO_HZ -e NO_HZ_COMMON
scripts/config -e PREEMPT_BUILD -d PREEMPT_NONE -d PREEMPT_VOLUNTARY -e PREEMPT -e PREEMPT_COUNT -e PREEMPTION -e PREEMPT_DYNAMIC

scripts/config -d CC_OPTIMIZE_FOR_PERFORMANCE \
            -e CC_OPTIMIZE_FOR_PERFORMANCE_O3

scripts/config -m TCP_CONG_CUBIC \
            -d DEFAULT_CUBIC \
            -e TCP_CONG_BBR2 \
            -e DEFAULT_BBR2 \
            --set-str DEFAULT_TCP_CONG bbr2

scripts/config -e LRU_GEN -e LRU_GEN_ENABLED -d LRU_GEN_STATS

scripts/config -d TRANSPARENT_HUGEPAGE_ALWAYS -e TRANSPARENT_HUGEPAGE_MADVISE

scripts/config -e DAMON \
            -e DAMON_VADDR \
            -e DAMON_DBGFS \
            -e DAMON_SYSFS \
            -e DAMON_PADDR \
            -e DAMON_RECLAIM \
            -e DAMON_LRU_SORT

scripts/config -d ZRAM_DEF_COMP_LZORLE \
            -e ZRAM_DEF_COMP_ZSTD \
            --set-str ZRAM_DEF_COMP zstd \
            -d ZSWAP_COMPRESSOR_DEFAULT_LZ4 \
            -e ZSWAP_COMPRESSOR_DEFAULT_ZSTD \
            --set-str ZSWAP_COMPRESSOR_DEFAULT zstd

scripts/config --set-val MODULE_COMPRESS_ZSTD_LEVEL 19 -e MODULE_COMPRESS_ZSTD_ULTRA --set-val MODULE_COMPRESS_ZSTD_LEVEL_ULTRA 22 --set-val ZSTD_COMP_VAL 22

scripts/config -e USER_NS

scripts/config -d DEBUG_INFO \
            -d DEBUG_INFO_DWARF4 \
            -d DEBUG_INFO_DWARF5 \
            -d SLUB_DEBUG \
            -d PM_DEBUG \
            -d PM_ADVANCED_DEBUG \
            -d PM_SLEEP_DEBUG \
            -d ACPI_DEBUG \
            -d SCHED_DEBUG \
            -d LATENCYTOP \
            -d DEBUG_PREEMPT

make prepare