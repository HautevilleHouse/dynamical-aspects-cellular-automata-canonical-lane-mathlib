import canonicalLaneMathlib.AdmissibleClass

/-!
# Cellular Automaton State Space Package

This module defines the state-space structure for cellular automata dynamical
systems: configuration space, shift operator, and the space-time cylinder sets
that form the basis for the admissible-class closure.
-/

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure CellularAutomatonConfig (Alphabet : Type u) (IndexSet : Type v) where
  cellMap : IndexSet -> Alphabet

def shiftOperator {Alphabet : Type u} {IndexSet : Type v} [AddGroup IndexSet]
    (a : CellularAutomatonConfig Alphabet IndexSet) (s : IndexSet) :
    CellularAutomatonConfig Alphabet IndexSet := {
  cellMap := fun i => a.cellMap (i + s)
}

structure CylinderSet {Alphabet : Type u} {IndexSet : Type v} (config : CellularAutomatonConfig Alphabet IndexSet) where
  finitePattern : IndexSet -> Alphabet
  supportFinite : Finset IndexSet
  patternMatches : ∀ i ∈ supportFinite, config.cellMap i = finitePattern i

structure CellularAutomatonStateSpace (Alphabet : Type u) (IndexSet : Type v) where
  configSpace : Type w
  shiftAction : IndexSet -> configSpace -> configSpace
  cylinderSetsBasis : Set (Set configSpace)
  cylinderSetsClosedUnderIntersection : Prop
  cylinderSetsGenerateSigmaAlgebra : Prop

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse