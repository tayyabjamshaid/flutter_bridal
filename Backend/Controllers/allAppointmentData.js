import { ApiError, Client, Environment } from "square";
import moment from "moment"

const client = new Client({
  environment: Environment.Sandbox,
  accessToken: "EAAAEAxSiuCa_hna1venXGtaaOrsIg6VY00eZH6YuTfUkW6UXac4QJ-L7UoPjMnh",
})
const bookingsApi = client.bookingsApi;
const customersApi = client.customersApi;

class allSquareData {
    static allAppointmentData=async(req,res)=>{
        try {
            let obj1=[];
            const response = await bookingsApi.listBookings();
          let data=response.result.bookings;
          // console.log(data,'DATA')
          for(let work of data){

            // console.log(work,work.appointmentSegments,"Tayyab")
            var id=work.id;
            var customerId=work.customerId;
            const { result, ...httpResponse } = await customersApi.retrieveCustomer(customerId);
          var customerName=  result.customer.givenName;
            var timeDate=work.startAt;
             var startTime=moment(timeDate).format('LT');
            var status=work.status;
            var locationType=work.locationType;
           
            for(let segments of work.appointmentSegments){
              var duration=segments.durationMinutes;
              var endTime = moment(timeDate)
                   .add(0,'seconds')
                   .add(duration,'minutes')
                   .format('LT');
            }
            obj1.push({id,customerName,status,duration,locationType,startTime,endTime})
          }
     
         res.send(obj1)
        
          } catch(error) {
            if (error instanceof ApiError) {
              const errors = error.result;
               const { statusCode, headers } = error;
               console.log(statusCode, headers )
            }
          }}
         
    }
    export default allSquareData;
