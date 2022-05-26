import { ApiError, Client, Environment } from "square";


const client = new Client({
  environment: Environment.Sandbox,
  accessToken: "EAAAEAxSiuCa_hna1venXGtaaOrsIg6VY00eZH6YuTfUkW6UXac4QJ-L7UoPjMnh",
})

const catalogApi = client.catalogApi;
class allProductData {
  static allCatalogData=async(req,res)=>{
            try {
              let obj1=[];
              const { result, ...httpResponse } = await catalogApi.listCatalog();
              for(let [index,work] of result.objects.entries()){
                 console.log(index)
                 var catalogObjectId=work.id;
                 var categoryName=work.itemData.name;
                 var catalogType=work.itemData.productType;
               //   console.log(work)
                 for(let segments of work.itemData.variations){
                  //   console.log(segments)
                 var catalogName=segments.itemVariationData.name;
                 var catalogId=segments.itemVariationData.itemId;
                 var pricingType=segments.itemVariationData.pricingType;
                 var catalogPrice='',catalogCurrency=''; 
                 if(segments.itemVariationData.serviceDuration){
                  catalogPrice=segments.itemVariationData.serviceDuration.toString();
                  catalogPrice=parseInt(catalogPrice);
                 }
                
               
                 if(segments.itemVariationData.priceMoney?.amount){
                       catalogPrice=segments.itemVariationData.priceMoney.amount.toString();
                       catalogPrice=parseInt(catalogPrice);
                       catalogCurrency=segments.itemVariationData.priceMoney.currency.toString();
                    }
       
          }
                 obj1.push({index,categoryName,catalogType,catalogName,catalogId,pricingType,catalogPrice,catalogCurrency})
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
    export default allProductData;
