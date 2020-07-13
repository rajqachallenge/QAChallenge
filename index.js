var express = require('express');
var app = express();
var fs = require("fs");
const cron = require("node-cron");
const bodyParser = require('body-parser');
const mysql = require('mysql');
app.use(express.static('./'));
app.use(bodyParser.urlencoded({ extended: false }));
var jsonParser = bodyParser.json({
    inflate: false,
    strict: true
});
function getConnection(){
    return mysql.createConnection({
        host:'localhost',
        user: 'root',
        database:'QA_db'
    })
}
app.post('/message/scheduled', jsonParser, (req, res) => {
    res.sendStatus(202);
    
    var clientMessage = req.body.message;
    var time = req.body.time;
    const queryInsertString = 'INSERT INTO client_message (req_message, print_time) VALUES (?,?)'
    const querySelectString  = 'SELECT * FROM client_message'
    const queryUpdateString  = 'UPDATE client_message SET isqueued = ? WHERE id = ?'
    const queryUpdatePrintString  = 'UPDATE client_message SET isPrinted = ? WHERE id = ?'
    getConnection().query(queryInsertString, [clientMessage, time], (err, res) => {
        if(err)
        {
            console.log("DB error" +  err)
            res.sendStatus(500);
        }
        
        console.log("A new request added");

     getConnection().query(querySelectString, (err, result) => {
        if(err)
        {
            console.log("DB error" +  err)
            res.sendStatus(500);
        }
            for(var i=0; i<result.length; i++ ){
            
           if(result[i].isPrinted === 0 && result[i].isqueued === 1)
            {
                
                var dataId = result[i].id;
                getConnection().query(queryUpdateString,[0,dataId],(err,res) => {
                    
                    if(err)
                    {
                        console.log("DB error" +  err)
                        res.sendStatus(500);
                    }
                })
                
            }

            
               var idCollection = result[i].id;
               if(result[i].isqueued === 0 && result[i].isPrinted === 0)
              {
                 
                 getConnection().query(queryUpdateString, [1,idCollection], (err,res) => 
                 {
                      if(err)
                      {
                          console.log("DB error" +  err)
                          res.sendStatus(500);
                      }
        
                  })

                
                  
                var cronF = result[i].print_time.split(':');
                var cronScedule = cronF[2] +" "+cronF[1] + " " + cronF[0] + " " + "* * *";
                console.log("Message " + clientMessage + " to be sent at " + time);

                
                var task = cron.schedule(cronScedule, function () {
                
                console.log("Message SENT>>>>>>>>>>> "+clientMessage+ " at " + new Date());
                getConnection().query(queryUpdatePrintString, [1,idCollection], (err,res) => {
                    
                    
                        if(err)
                        {
                            console.log("DB error" +  err)
    
                        }

                    })

                    
                
                    })

                }

            }

            
        })

    })    

    

    res.end();
   
    
})
    var server = app.listen(8081, function () {
    var host = server.address().address
    var port = server.address().port
    console.log("Example app listening at http://%s:%s", host, port)
})