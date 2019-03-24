# vanhackathon-tractionguest-amazing-solution

This application was made to integrate directly with the Traction Guest VMS experience.

The idea is for Vehicular Documents Payers here in Brazil to use VMS with their costumer, where they would fill the information about their car plate, activating web-crawlers/database searchs.

That makes the whole process quicker to the Document Payer, because when they do those researchs manually, they spent several minutes with the client just understanding what is their sittuation and  have to search those informations in several websites.

# How to use it

## API

### Endpoints

__POST__ search

Starts the search in the web-crawlers/databases for the vehicle with the same plate send in the body

#### Body
    {
	    "plate":"AAA0001"
    }


#### Response
__HTTP CODE 204__ if nothing for that plate is found

__HTTP CODE 200 with the Vehicle JSON__ 

## Traction Guest

To use that experience in Traction Guest, please refer to the experience __https://account.tractionguest.com/#/Experience/11768__ or the screenshot __experience.jpeg__ in the root of this project 