/*
 * Program used in the experimental evaluation of the following papers.
 * 2008ESOP - Chawdhary,Cook,Gulwani,Sagiv,Yang - Ranking Abstractions
 * 2010SAS - Alias,Darte,Feautrier,Gonnord, Multi-dimensional Rankings, Program Termination, and Complexity Bounds of Flowchart Programs
 *
 * Date: 2014
 * Author: Caterina Urban
 */



int main() {
	int x = 0;
	int y = 0;
	int z = 0;
	int tx = 0;
	while (x >= y && x <= tx + z) {
		if (0) {
			z = z - 1;
			tx = x;
			x = 0;
		} else {
			y = y + 1;
		}
	}
	return 0;
}
