from flask import Flask, request, jsonify
import pandas as pd

app = Flask(__name__)

@app.route('/api/getData', methods=['GET'])
def getData():
    
    #/getData – return all of the data
    #gets the last 5 years of Apple Stock Price
    if request.method=='GET':

        df = pd.read_csv('AAPL.csv')
        return {'Stock data': df.to_dict()}, 200
    
#-------------------------------------------------------------------------------------------  
       
@app.route('/api/getDataDate', methods=['GET'])
def getDataDate():

    #/getData/{Date} – get data for a specific date
    if request.method=='GET':
        
        df = pd.read_csv('AAPL.csv')
        data = request.get_json()
        df = df[df.Date == data['Date']]
        
        return {'Stock data': df.to_dict()}, 200

#-------------------------------------------------------------------------------------------     
    
@app.route('/api/movingAvg', methods=['GET'])
def movingAvg():
    
    
    #/calculate10DayAverage – get 10 day average for the last 10 days
    if request.method=='GET':
        
        df = pd.read_csv('AAPL.csv')
        result = df.tail(10)
        data = request.get_json()
        DataPayload = data ['Close']
        while(DataPayload != 0):
            {
                DataPayload + DataPayload
            }
        result = DataPayload / 10
        return jsonify(result)
       
    
#-------------------------------------------------------------------------------------------

@app.route('/api/addData', methods=['POST'])
def addData():
        
    #/addData -> Given a Data Payload add it to the dataset
    #Given a Data Payload this function adds it to the dataset
    if request.method=='POST':

        #insert new row in dataset
        df = pd.read_csv('AAPL.csv')
        data = request.get_json()
        DataPayload=[data['Date'], data['Open'], data['High'], data["Low"], data['Close'], data['Adj Close'], data['Volume']]
        df = df.append(pd.Series(DataPayload, index=df.columns), ignore_index=True)
        df.to_csv('AAPL.csv', index=False)
        
        return {'message': 'Payload added'}, 201
    
#-------------------------------------------------------------------------------------------

@app.route('/api/DateData', methods=['POST'])
def DateData():
    if request.method=='POST':
        
        #get data for given date range
        df = pd.read_csv('AAPL.csv')
        data = request.get_json()
        df['DateRange'] = data['Date']
        
        start_date = "2020-08-11"
        end_date = "2020-13-11"
        
        range = (df['DateRange'] >= start_date) & (df['DateRange'] <= end_date)

        #Assign the selected mask to a new dataframe
        selected_dataset = df.loc[range]
        df.to_csv('AAPL.csv', index=False)
        return {'Stock data': selected_dataset.to_dict()}, 201

    
#-------------------------------------------------------------------------------------------

@app.route('/api/updateData', methods=['PUT'])
def updateData():

    #/updateData -> Given a Data Payload of a date, update the data that is given
    if request.method=='PUT':
        
        df = pd.read_csv('AAPL.csv')
        data = request.get_json()
        df = df[df.Date == data['Date']]
        DataPayload2=[data['Open'], data['High'], data["Low"], data['Close'], data['Adj Close'], data['Volume']]
        df = df.append(pd.Series(DataPayload2, index=df.columns), ignore_index=True)
        df.to_csv('AAPL.csv', index=False)
        
        return {'message': 'data for date given was updated'}, 200
    
#-------------------------------------------------------------------------------------------
    
@app.route('/api/deleteDate', methods=['DELETE'])
def deleteDate():   
    
     #/deleteDate -> Given Date delete the data for that date
    if request.method=='DELETE':
        
        df = pd.read_csv('AAPL.csv')
        data = request.get_json()
        df = df[df.Date != data['Date']]
        
        df.to_csv('AAPL.csv', index=False)

        return {'message': 'data for date given was deleted'}, 200
    
#-------------------------------------------------------------------------------------------
    
 
if __name__ == '__main__':
    app.run(debug=True)