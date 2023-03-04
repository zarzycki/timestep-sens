begin

; quick script written to add std and double check climo values
; in response to reviewers of JAMES article

; can be "tc" or "seeds"
f = addfile("cymep_NATL_seeds.nc","r")

print(chartostring(f->model_names))

print("... count")
tcs = f->py_count
means = dim_avg_n_Wrap(tcs,1)
print(""+means)
print("------------")
stds = dim_stddev_n_Wrap(tcs,1)
print(""+stds)
print("------------")
delete(tcs)
delete(means)
delete(stds)
print("     ")

print("... tcd")
tcs = f->py_tcd
means = dim_avg_n_Wrap(tcs,1)
print(""+means)
print("------------")
stds = dim_stddev_n_Wrap(tcs,1)
print(""+stds)
print("------------")
delete(tcs)
delete(means)
delete(stds)
print("     ")

print("... ace")
tcs = f->py_ace
means = dim_avg_n_Wrap(tcs,1)
print(""+means)
print("------------")
stds = dim_stddev_n_Wrap(tcs,1)
print(""+stds)
print("------------")
delete(tcs)
delete(means)
delete(stds)
print("     ")

end
