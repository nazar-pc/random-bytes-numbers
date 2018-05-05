/**
 * @package Random bytes and numbers
 * @author  Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @license 0BSD
 */
lib		= require('..')
test	= require('tape')

test('Random bytes and numbers', (t) !->
	t.plan(6)

	random1 = lib.random_bytes(10)
	random2 = lib.random_bytes(10)
	t.ok(random1 instanceof Uint8Array, 'Random bytes are in Uint8Array')
	t.equal(random1.length, 10, 'Random bytes of correct length')
	t.notEqual(random1.join(','), random2.join(','), 'Random bytes are random')

	random_int1 = lib.random_int(1, 999)
	random_int2 = lib.random_int(1, 999)
	t.notEqual(random_int1, random_int2, 'Random ints are random')

	random = lib.random()
	t.ok(random >= 0, 'Random number is not negative')
	t.ok(random < 1, 'Random number is less than 1')
)
