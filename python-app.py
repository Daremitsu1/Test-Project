import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.express as px

# load the predictions from the R program
predictions = pd.read_csv("predictions.csv")

# create the Dash app
app = dash.Dash()
app.layout = html.Div([
    dcc.Graph(
        figure=px.scatter(predictions, x="date", y="confirmed", title="COVID-19 Confirmed Cases")
    )
])

if __name__ == "__main__":
    app.run_server(debug=True)