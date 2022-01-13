### NO SCALING ###

# Test CPU

jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/cpu-2000-10-300-hpa-2-nodes.csv -e -o cpu-2000-10-300-hpa-2-nodes

# Test Custom-Metric

jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/custom-2000-10-300-hpa-2-nodes.csv -e -o custom-2000-10-300-hpa-2-nodes


### TEST HPA ###

# Test CPU

jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/cpu-2000-10-300-hpa-2-nodes.csv -e -o cpu-2000-10-300-hpa-2-nodes

# Test Custom-Metric

jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/custom-2000-10-300-hpa-2-nodes.csv -e -o custom-2000-10-300-hpa-2-nodes

# Test CPU with Cluster Autoscaling

jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/cpu-2000-10-300-hpa-2-4-nodes.csv -e -o cpu-2000-10-300-hpa-2-4-nodes

# Test Custom-Metric with Cluster Autoscaling

jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/custom-2000-10-300-hpa-2-4-nodes.csv -e -o custom-2000-10-300-hpa-2-4-nodes


### TEST VPA ###

jmeter -n -t jmeter/small-load.jmx -l jmeter/cpu-200-10-infinite-vpa-2-nodes.csv -e -o jmeter/cpu-200-10-infinite-vpa-2-nodes

# Test CPU

jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/cpu-2000-10-300-vpa-2-nodes.csv -e -o cpu-2000-10-300-vpa-2-nodes

# Test Custom-Metric 

VPA only works with CPU and memory usage

# Test CPU with Cluster Autoscaling

jmeter -n -t jmeter/cpu-request-settings.jmx -l jmeter/cpu-2000-10-300-vpa-2-4-nodes.csv -e -o cpu-2000-10-300-vpa-2-4-nodes

# Test Custom-Metric with Cluster Autoscaling

VPA only works with CPU and memory usage
