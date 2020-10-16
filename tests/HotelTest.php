<?php

use Laravel\Lumen\Testing\DatabaseMigrations;
use Laravel\Lumen\Testing\DatabaseTransactions;

class HotelTest extends TestCase
{
    /**
     * Test API route
     * /thn_test/api/id [GET]
     */
    public function testShouldReturnHotel()
    {
        $this->get("thn_test/api/hotels/1", []);
        $this->seeStatusCode(200);
        $this->seeJsonStructure(
            $data = [
                'hotel',
                'facilities',
                'rooms',
                'bookings'
            ]
        );
    }

    public function testShouldNotReturnHotel()
    {
        $response = $this->call('GET', "thn_test/api/hotels/100");

        $this->assertEquals(404, $response->status());
    }
}
