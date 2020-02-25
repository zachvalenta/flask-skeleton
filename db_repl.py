#!/usr/bin/env python

from app import Artist, Performance, PerformanceSchema

nas = Artist.query.get(2)
performances = Performance.query.all()
performance_schema = PerformanceSchema(many=True)
perfs = performance_schema.dump(performances)
perf = perfs[14]

print("\n 🔍 sample query obj: nas (Artist) \n\n")
print(f"songs for artist: nas.song | " f"{nas.songs} \n")
print("\n 🔍 sample serializer: perf (Performance) \n\n")
print(f"id: perf['perf_id'] | {perf['perf_id']} \n")
print(f"song performed: perf['song']['name'] | {perf['song']['name']} \n")
print(f"concert of performance: perf['concert']['name'] | {perf['concert']['name']} \n")
