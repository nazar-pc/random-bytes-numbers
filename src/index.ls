/**
 * @package Random bytes and numbers
 * @author  Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @license 0BSD
 */
if typeof crypto != 'undefined'
	/**
	 * @param {number} size
	 *
	 * @return {!Uint8Array}
	 */
	random_bytes	= (size) ->
		array = new Uint8Array(size)
		crypto.getRandomValues(array)
		array
else
	/**
	 * @param {string} size
	 *
	 * @return {!Uint8Array}
	 */
	random_bytes	= require('crypto').randomBytes
/**
 * This function is the same as & operator, but supports full 53bit JavaScript numbers instead of just 32bit
 *
 * https://stackoverflow.com/a/43666199/3806795
 *
 * @param {number} number1
 * @param {number} number2
 *
 * @return {number}
 */
function bitwise_and (number1, number2)
	hi			= 0x80000000
	low			= 0x7fffffff
	hi1			= ~~(number1 / hi)
	hi2			= ~~(number2 / hi)
	low1		= number1 .&. low
	low2		= number2 .&. low
	hi_result	= hi1 .&. hi2
	low_result	= low1 .&. low2
	hi_result * hi + low_result
/**
 * https://github.com/EFForg/OpenWireless/blob/8075811b59bab6e4f4c79879e4787b24cdbb260d/app/js/diceware.js#L57
 *
 * @param {number} min
 * @param {number} max
 *
 * @return {number}
 */
function random_int (min, max)
	rval			= 0
	range			= max - min
	bits_needed		= Math.ceil(Math.log2(range))
	bytes_needed	= Math.ceil(bits_needed / 8)
	mask			= 2**bits_needed - 1

	bytes	= random_bytes(bytes_needed)
	p		= (bytes_needed - 1) * 8
	for i from 0 til bytes_needed
		rval	+= bytes[i] * 2**p
		p		-= 8

	# Use & to apply the mask and reduce the number of recursive lookups
	rval = bitwise_and(rval, mask)

	if rval >= range
		# Integer out of acceptable range
		return random_int(min, max)
	# Return an integer that falls within the range
	min + rval
/**
 * @return {number}
 */
function random
	random_int(0, Number.MAX_SAFE_INTEGER) / (Number.MAX_SAFE_INTEGER + 1)

function Wrapper
	{
		'random_bytes'	: random_bytes
		'random_int'	: random_int
		'random'		: random
	}

if typeof define == 'function' && define['amd']
	# AMD
	define(Wrapper)
else if typeof exports == 'object'
	# CommonJS
	module.exports = Wrapper()
else
	# Browser globals
	@'random_bytes_numbers' = Wrapper()
