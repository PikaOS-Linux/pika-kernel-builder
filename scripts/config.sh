#!/bin/bash

echo "Pika Kernel - Applying configuration"

cp ../config .config

scripts/config -k -d CONFIG_GENERIC_CPU
scripts/config -k -e CONFIG_GENERIC_CPU2
scripts/config -e CACHY
scripts/config -e SCHED_BORE

scripts/config -e HZ_300 --set-val HZ 750
scripts/config -d HZ_PERIODIC -d NO_HZ_IDLE -d CONTEXT_TRACKING_FORCE -e NO_HZ_FULL_NODEF -e NO_HZ_FULL -e NO_HZ -e NO_HZ_COMMON -e CONTEXT_TRACKING
scripts/config -e PREEMPT_BUILD -d PREEMPT_NONE -d PREEMPT_VOLUNTARY -e PREEMPT -e PREEMPT_COUNT -e PREEMPTION -e PREEMPT_DYNAMIC

scripts/config -d CC_OPTIMIZE_FOR_PERFORMANCE \
            -e CC_OPTIMIZE_FOR_PERFORMANCE_O3

scripts/config -m TCP_CONG_CUBIC \
            -d DEFAULT_CUBIC \
            -e TCP_CONG_BBR \
            -e DEFAULT_BBR \
            --set-str DEFAULT_TCP_CONG bbr

scripts/config -m NET_SCH_FQ_CODEL \
            -e NET_SCH_FQ \
            -d DEFAULT_FQ_CODEL \
            -e DEFAULT_FQ \
            --set-str DEFAULT_NET_SCH fq

scripts/config -e LRU_GEN -e LRU_GEN_ENABLED -d LRU_GEN_STATS

scripts/config -d TRANSPARENT_HUGEPAGE_MADVISE -e TRANSPARENT_HUGEPAGE_ALWAYS

scripts/config -e PER_VMA_LOCK -d PER_VMA_LOCK_STATS

scripts/config -e DAMON \
            -e DAMON_VADDR \
            -e DAMON_DBGFS \
            -e DAMON_SYSFS \
            -e DAMON_PADDR \
            -e DAMON_RECLAIM \
            -e DAMON_LRU_SORT

scripts/config --set-val MODULE_COMPRESS_ZSTD_LEVEL 19 -e MODULE_COMPRESS_ZSTD_ULTRA --set-val MODULE_COMPRESS_ZSTD_LEVEL_ULTRA 22 --set-val ZSTD_COMP_VAL 22

scripts/config -e EFI_HANDOVER_PROTOCOL

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
            -d DEBUG_PREEMPT

make prepare
