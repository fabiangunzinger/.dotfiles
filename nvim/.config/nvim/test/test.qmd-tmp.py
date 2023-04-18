




























































import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.DataFrame({'a': range(200), 'b': range(100, 300)})

df['b'].plot()
plt.show()













#| label: fig-polar
#| fig-cap: "A line plot on a polar axis"
# Now we add a comment here
import numpy as np
import matplotlib.pyplot as plt

r = np.arange(0, 2, 0.01)
theta = 2 * np.pi * r
fig, ax = plt.subplots(
  subplot_kw = {'projection': 'polar'} 
)
ax.plot(theta, r)
ax.set_rticks([0.5, 1, 1.5, 2])
ax.grid(True)
plt.show()





import pandas as pd

df = pd.DataFrame({'a': [1, 2, 3, 4, 5]})
df.head()



x = np.arange(0, 5, 0.1)
y = np.sin(x)
plt.plot(x, y)



a = [1, 2, 3]
b = [4]
a + b + [5]
